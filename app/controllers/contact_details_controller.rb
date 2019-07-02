class ContactDetailsController < ApplicationController
  before_action :set_parent, only: [:index, :new]
  before_action :set_contact_detail, only: [:show, :edit, :update, :destroy]

  # GET /contact_details
  # GET /contact_details.json
  def index
      @document = Document.find(params[:document_id])

    @contact_details  = @document.contact_details.all
  end

  # GET /contact_details/1
  # GET /contact_details/1.json
  def show
    @document = @contact_detail.document
  end

  # GET /contact_details/new
  def new
    @contact_detail = ContactDetail.new
  end

  # GET /contact_details/1/edit
  def edit
  end

  # POST /contact_details
  # POST /contact_details.json
  def create
    @contact_detail = ContactDetail.new(contact_detail_params)

    respond_to do |format|
      if @contact_detail.save
        format.html { redirect_to @contact_detail, notice: 'Contact detail was successfully created.' }
        format.json { render :show, status: :created, location: @contact_detail }
      else
        format.html { render :new }
        format.json { render json: @contact_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_details/1
  # PATCH/PUT /contact_details/1.json
  def update
    respond_to do |format|
      if @contact_detail.update(contact_detail_params)
        format.html { redirect_to @contact_detail, notice: 'Contact detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact_detail }
      else
        format.html { render :edit }
        format.json { render json: @contact_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_details/1
  # DELETE /contact_details/1.json
  def destroy
    @contact_detail.destroy
    respond_to do |format|
      format.html { redirect_to contact_details_url, notice: 'Contact detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_detail
      @contact_detail = ContactDetail.find(params[:id])
    end

    def set_parent
      @document = Document.find(params[:document_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_detail_params
      params.require(:contact_detail).permit(:business_name, :street_address_01, :business_street_address_02, :business_city, :business_state, :business_postal_code, :business_phone, :name_of_representative)
    end
end
