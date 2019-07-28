# authorization for agreements
class Agreements::AuthorizationRequestsController < ApplicationController
  	before_action :authenticate_user!
	before_action :set_agreement
	def new
		
	end

	def create
		authorization_request = @agreement.authorization_requests.new(authorization_request_params)
		authorization_request.agreement = @agreement

		@project = @agreement.project

		if authorization_request.save
			redirect_to @project, notice: 	"Success"
		else
			redirect_to @project, alert: 	"Failure"
		end		

	end

	private

		def set_agreement
			@agreement = Agreement.find(params[:agreement_id])
		end

		def project_user_params
			params.require(:authorization_request).permit(:recipient_id)
		end
end
