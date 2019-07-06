class DeliverablesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_parent, only: [:index, :new, :create]
  before_action :set_deliverable, only: [:show, :edit, :update, :destroy]

  # GET /deliverables
  # GET /deliverables.json
  def index
    @deliverables = Deliverable.all
  end

  # GET /deliverables/1
  # GET /deliverables/1.json
  def show
  end

  # GET /deliverables/new
  def new
    @agreement = Agreement.find(params[:agreement_id])

    @deliverable = @agreement.deliverables.new
  end

  # GET /deliverables/1/edit
  def edit
  end

  # POST /deliverables
  # POST /deliverables.json
  def create
    @deliverable = @agreement.deliverables.new(deliverable_params)

    respond_to do |format|
      if @deliverable.save
        format.html { redirect_to @deliverable, notice: 'Deliverable was successfully created.' }
        format.json { render :show, status: :created, location: @deliverable }
      else
        format.html { render :new }
        format.json { render json: @deliverable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deliverables/1
  # PATCH/PUT /deliverables/1.json
  def update
    respond_to do |format|
      if @deliverable.update(deliverable_params)
        format.html { redirect_to @deliverable, notice: 'Deliverable was successfully updated.' }
        format.json { render :show, status: :ok, location: @deliverable }
      else
        format.html { render :edit }
        format.json { render json: @deliverable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deliverables/1
  # DELETE /deliverables/1.json
  def destroy
    @deliverable.destroy
    respond_to do |format|
      format.html { redirect_to deliverables_url, notice: 'Deliverable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deliverable
      @deliverable = Deliverable.find(params[:id])
    end
    def set_parent
      @agreement = Agreement.find(params[:agreement_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deliverable_params
      params.require(:deliverable).permit(:agreement_id, :body)
    end
end
