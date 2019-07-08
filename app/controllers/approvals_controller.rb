class ApprovalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_approval, only: [:show, :edit, :update, :destroy]

  # GET /approvals
  # GET /approvals.json
  def index
    @agreement = Agreement.find(params[:agreement_id])
    @approvals = @agreement.approvals.all
  end

  # GET /approvals/1
  # GET /approvals/1.json
  def show
  end

  # GET agreements/x/approvals/new
  def new
    @agreement      = Agreement.find(params[:agreement_id])
    @document       = @agreement.document
    @deliverables   = @agreement.deliverables
    @approval       = @agreement.approvals.new
  end

  # GET /approvals/1/edit
  def edit
  end

  # POST agreements/x/approvals
  # POST agreements/x//approvals.json
  def create
    @agreement = Agreement.find(params[:agreement_id])
    @approval = @agreement.approvals.new(approval_params)

    respond_to do |format|
      if @approval.save
        format.html { redirect_to @approval, notice: 'Approval was successfully created.' }
        format.json { render :show, status: :created, location: @approval }
      else
        format.html { render :new }
        format.json { render json: @approval.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /approvals/1
  # PATCH/PUT /approvals/1.json
  def update
    respond_to do |format|
      if @approval.update(approval_params)
        format.html { redirect_to @approval, notice: 'Approval was successfully updated.' }
        format.json { render :show, status: :ok, location: @approval }
      else
        format.html { render :edit }
        format.json { render json: @approval.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /approvals/1
  # DELETE /approvals/1.json
  def destroy
    @approval.destroy
    respond_to do |format|
      format.html { redirect_to approvals_url, notice: 'Approval was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_approval
      @approval = Approval.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def approval_params
      params.require(:approval).permit(:agreement_id, :status)
    end
end
