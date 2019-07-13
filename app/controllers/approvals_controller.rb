class ApprovalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_approval, only: [:show, :edit, :update, :destroy]
  before_action :load_agreement, only: [:new, :create, :index]

  # GET /approvals
  # GET /approvals.json
  def index
    @approvals = @agreement.approvals.all
  end

  # GET /approvals/1
  # GET /approvals/1.json
  def show
  end

  # GET agreements/x/approvals/new
  def new
    @document       = @agreement.document
    @deliverables   = @agreement.deliverables
    @approval       = @agreement.approvals.new
  end

  # GET /approvals/1/edit
  # approvals shouyld be immutable

  # def edit
  # end

  # POST agreements/x/approvals
  # POST agreements/x//approvals.json
  def create
    @approval = @agreement.approvals.new(approval_params)
    @approval.user = current_user
    @approval.signed_on = DateTime.now

    respond_to do |format|
      if @approval.save
        format.html { redirect_to @agreement, notice: 'Approval was successfully created.' }
        format.json { render :show, status: :created, location: @approval }
      else
        format.html { render :new }
        format.json { render json: @approval.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /approvals/1
  # PATCH/PUT /approvals/1.json
  # approvals shouyld be immutable

  # def update
  #   respond_to do |format|
  #     if @approval.update(approval_params)
  #       format.html { redirect_to @approval, notice: 'Approval was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @approval }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @approval.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /approvals/1
  # DELETE /approvals/1.json
  # approvals shouyld be indellible

  # def destroy
  #   @approval.destroy
  #   respond_to do |format|
  #     format.html { redirect_to approvals_url, notice: 'Approval was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_approval
      @approval = Approval.find(params[:id])
    end

    def load_agreement
      @agreement =  Agreement.find_by_id(params[:agreement_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def approval_params
      params.require(:approval).permit(:agreement_id, :status, :signature)
    end
end
