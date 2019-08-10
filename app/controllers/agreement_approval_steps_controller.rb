class AgreementApprovalStepsController < ApplicationController
  # ** big thing: Creating an approval should be treated as creating an attribute of 
  # the agreement. So steps should be like a shopping cart.
  before_action :authenticate_user!
  # before_action :authorize_approval
  # before_action :load_agreement, only: [:create, :show, :update]
  # before_action :set_approval, only: [:show, :edit, :update, :destroy]

  def index
    render_404
    # redirect_to "agreement_approval/edit"
    # render "#{STEPS.first.to_s.downcase}/edit"
  end


  def show
      approval_step   = AgreementApprovalStep.new(agreement_id: params[:agreement_id], step_params_id: params[:id])
      if approval_step.step.present?
        @agreement      = approval_step.agreement
        @approvable     = approval_step.wizard_step_approvable
        @project        = approval_step.project
        @document       = approval_step.document
        @step_document  = approval_step.step_document_partial

        @approval                 = Approval.new
        @approval.approvable_type = @approvable.class.to_s
        @approval.approvable_id   = @approvable.id

        render approval_step.step
        
      else
        render_404
      end
  end


  def create
    approval_step             = AgreementApprovalStep.new(agreement_id: params[:agreement_id], step_params_id: params[:id])
    @approvable               = approval_step.wizard_step_approvable

    @approval                 =  approval_step.wizard_step_approvable.approvals.new(approval_params)
    @approval.user            = current_user
    @approval.signed_on       = DateTime.now
    # @approval.signature = params[:signature]

    @approval.approvable_type = @approvable.class.to_s
    @approval.approvable_id   = @approvable.id

    @approval.signature = true

    
    if @approval.save!
      if approval_step.next_step && params[:commit].downcase.include?('continue')
        redirect_to agreement_agreement_approval_step_path(params[:agreement_id], approval_step.next_step)
      else
        redirect_to project_path(approval_step.project)
      end
      # redirect_to root_url
    else
      render step, :error => "Please complete all required fields"      
    end

  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def approval_params
      params.require(:approval).permit(:agreement_id, :status, :signature, :approvable_type, :approvable_id)
    end



  end