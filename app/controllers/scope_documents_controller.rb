class ScopeDocumentsController < ApplicationController
  before_action :set_scope_document, only: [:show, :edit, :update, :destroy]

  # GET /scope_documents
  # GET /scope_documents.json
  def index
    @scope_documents = ScopeDocument.all
  end

  # GET /scope_documents/1
  # GET /scope_documents/1.json
  def show
  end

  # GET /scope_documents/new
  def new
    @scope_document = ScopeDocument.new
  end

  # GET /scope_documents/1/edit
  def edit
  end

  # POST /scope_documents
  # POST /scope_documents.json
  def create
    @scope_document = ScopeDocument.new(scope_document_params)

    respond_to do |format|
      if @scope_document.save
        format.html { redirect_to @scope_document, notice: 'Scope document was successfully created.' }
        format.json { render :show, status: :created, location: @scope_document }
      else
        format.html { render :new }
        format.json { render json: @scope_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scope_documents/1
  # PATCH/PUT /scope_documents/1.json
  def update
    respond_to do |format|
      if @scope_document.update(scope_document_params)
        format.html { redirect_to @scope_document, notice: 'Scope document was successfully updated.' }
        format.json { render :show, status: :ok, location: @scope_document }
      else
        format.html { render :edit }
        format.json { render json: @scope_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scope_documents/1
  # DELETE /scope_documents/1.json
  def destroy
    @scope_document.destroy
    respond_to do |format|
      format.html { redirect_to scope_documents_url, notice: 'Scope document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scope_document
      @scope_document = ScopeDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scope_document_params
      params.require(:scope_document).permit(:project_name, :document_id)
    end
end
