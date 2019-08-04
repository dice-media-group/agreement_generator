class AgreementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_agreement, only: [:show, :edit, :update, :destroy]
  before_action :load_project, only: [:new, :create, :index]

  layout        "crm_docs", only: [:index, :show]


  # GET /agreements
  # GET /agreements.json
  def index
    @agreements = Agreement.all
  end

  # GET /agreements/1
  # GET /agreements/1.json
  def show
  end

  # GET /agreements/new
  def new
    @agreement    = @project.agreements.new
    @documents    = Document.all
    @agreement.deliverables.new
  end

  # GET /agreements/1/edit
  def edit
  end

  # POST /agreements
  # POST /agreements.json
  def create
    @agreement = @project.agreements.new(agreement_params)
    @agreement.user = current_user

    attach_payment_schedule
    attach_project_scope

    respond_to do |format|
      if @agreement.save
        format.html { redirect_to @agreement, notice: 'Agreement was successfully created.' }
        format.json { render :show, status: :created, location: @agreement }
      else
        format.html { render :new }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agreements/1
  # PATCH/PUT /agreements/1.json
  def update
    attach_payment_schedule
    attach_project_scope

    respond_to do |format|
      if @agreement.update(agreement_params)
        format.html { redirect_to @agreement, notice: 'Agreement was successfully updated.' }
        format.json { render :show, status: :ok, location: @agreement }
      else
        format.html { render :edit }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agreements/1
  # DELETE /agreements/1.json
  def destroy
    @agreement.destroy
    respond_to do |format|
      format.html { redirect_to agreements_url, notice: 'Agreement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agreement
      @agreement = Agreement.find(params[:id])
    end

    def load_project
      @project =  Project.find_by_id(params[:project_id])
    end

    def attach_payment_schedule
      version_timestamp = Time.now.to_s.delete(" ")
      @payment_schedule = PaymentSchedule.create!(version: version_timestamp)
      @agreement.scheduled_payments.each do |scheduled_payment|
        scheduled_payment.payment_schedule = @payment_schedule
      end
    end

    def attach_project_scope
      version_timestamp = Time.now.to_s.delete(" ")
      @project_scope = ProjectScope.create!(version: version_timestamp)
      @agreement.deliverables.each do |deliverable|
        deliverable.project_scope_id = @project_scope.id
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agreement_params
      params.require(:agreement)
        .permit(:project_id, 
                :provider_rep_name, 
                :provider_signature, 
                :provider_signed_on, 
                :client_rep_name, 
                :client_organization,
                :client_rep_signature, 
                :client_signed_on, 
                :signature, :signed_on, 
                :user_id, :document_id,
                :project_id,
                deliverables_attributes: [:id, :description, :_destroy],
                scheduled_payments_attributes: [:id, :due_date, :amount, :_destroy])
    end
end
