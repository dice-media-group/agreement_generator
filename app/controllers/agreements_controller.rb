class AgreementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_agreement, only: [:show, :edit, :update, :destroy]

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
    @agreement    = Agreement.new
    @documents    = Document.all
    @agreement.deliverables.new
  end

  # GET /agreements/1/edit
  def edit
  end

  # POST /agreements
  # POST /agreements.json
  def create
    @agreement = current_user.agreements.new(agreement_params)
    # @agreement.user_id = current_user
    # @agreement.user = current_user

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

    # Never trust parameters from the scary internet, only allow the white list through.
    def agreement_params
      params.require(:agreement)
        .permit(:provider_rep_name, :provider_signature, 
                :provider_signed_on, :client_rep_name, 
                :client_rep_signature, :client_signed_on, 
                :signature, :signed_on, 
                :user_id, :document_id,
                :project_id,
                deliverables_attributes: [:id, :description, :_destroy],
                scheduled_payments_attributes: [:id, :due_date, :amount, :_destroy])
    end
end
