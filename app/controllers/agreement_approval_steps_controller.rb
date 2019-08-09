class AgreementApprovalStepsController < ApplicationController
  # ** big thing: Creating an approval should be treated as creating an attribute of 
  # the agreement. So steps should be like a shopping cart.
  before_action :authenticate_user!
  # before_action :authorize_approval
  before_action :load_agreement, only: [:create, :show, :update]
  # before_action :set_approval, only: [:show, :edit, :update, :destroy]

  STEPS             = ['agreement_approval', 'project_scope_approval', 'payment_schedule_approval']
  STEP_JOIN_TABLES  = ['', 'deliverables', 'scheduled_payments']


  def index
    render_404
    # redirect_to "agreement_approval/edit"
    # render "#{STEPS.first.to_s.downcase}/edit"
  end


  def show
      if step.present?
        load_agreement
        @approvable = wizard_step_approvable
        @approval   = Approval.new
        @approval.approvable_type = @approvable.class.to_s
        @approval.approvable_id   = @approvable.id

        render step
        
      else
        render_404
      end
  end

  def update
    if wizard_step_project.update_attributes(params[:project])
      if next_step && params[:commit].downcase.include?('continue')
        redirect_to edit_project_project_part_path(wizard_step_project, next_step)
      else
        redirect_to project_path(@project)
      end
    else
      render step, :error => "Please complete all required fields"
    end
  end

  def create
    # @approvable = wizard_step_approvable
    approval_params[:user] = current_user
    approval_params[:signature] = true

    @approval =  wizard_step_approvable.approvals.new(approval_params)
    @approval.user = current_user
    @approval.signature = true
    if @approval.save!
      if next_step && params[:commit].downcase.include?('continue')
        redirect_to agreement_agreement_approval_step_path(params[:agreement_id], next_step)
      else
        redirect_to project_path(@project)
      end
      # redirect_to root_url
    else
      render step, :error => "Please complete all required fields"      
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_approval
      @approval =  wizard_step_approvable.approvals.new
    end

    def load_agreement
      @agreement  =  Agreement.find_by_id(params[:agreement_id])
      @document   = @agreement.document
      @project    = @agreement.project
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def approval_params
      params.require(:approval).permit(:agreement_id, :status, :signature, :approvable_type, :approvable_id)
    end


    def authorize_agreement
      @agreement = wizard_step_agreement
      if @agreement.user_id != current_user.id && !current_user.is_admin?
        # render(:file => "#{Rails.root.to_s}/public/403.html", :layout => false, :status => 403)
        render file: "#{Rails.root}/public/403", :layout => false, :status => 404
      end
    end

    def wizard_step_approvable
      load_agreement
      # create a hash, STEP_JOIN_LOOKUP, with STEPS as key and STEP_JOIN_TABLES as values
      # keys.zip(values) { |a,b| h[a.to_sym] = b } 
      step_join_lookup_hash  = {}

      STEPS.zip(STEP_JOIN_TABLES) { |a,b| step_join_lookup_hash[a] = b } 
      # appovable is a child of @agreement (e.g. payment_schedule, project_scope)
      # we use joins to get the parent since child is has_many :through
      if step == 'agreement_approval'
        @approvable = Agreement.find(params[:agreement_id])
      else
        approvable_class  = step.split("_approval").first.camelcase.constantize
        approvable_join_table   = step_join_lookup_hash[step]
        @approvable   = approvable_class.joins(approvable_join_table.to_sym).where("#{approvable_join_table.to_sym}.agreement_id = ?", params[:agreement_id]).distinct.last
      end
      @approvable
    end

    def step
      step_name = STEPS.find {|a_step| a_step == params[:id].to_s.downcase}
    end

    def next_step
      current_step_index = STEPS.index(step)
      next_step = STEPS[current_step_index+1]
    end
  

  end