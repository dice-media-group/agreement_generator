class AgreementPreviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_agreement, only: [:show]

  def show

    respond_to do |format|
        format.html
        format.pdf do
	    render :pdf => "#{@agreement.project.name}_#{@agreement.document.name}",
	      :layout => "agreement_preview_pdf.html",
	      template: "agreement_previews/show.pdf.erb",
        zoom: 1,
        dpi: 300
        end
    end
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agreement
      @agreement = Agreement.find(params[:id])
    end
end
