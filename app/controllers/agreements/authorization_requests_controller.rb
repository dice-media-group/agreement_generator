# authorization for agreements
class Agreements::AuthorizationRequestsController < ApplicationController
  	before_action :authenticate_user!
	before_action :set_agreement
	def new
		
	end

	def create
		authorization_request = @agreement.authorization_requests.new(authorization_request_params)
		@project = @agreement.project
		mail_authorization_request(params[:recipient_id], @agreement)

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

		def authorization_request_params
			params.require(:authorization_request).permit(:recipient_id)
		end

		def mail_authorization_request(email_recipient, agreement)
			UserMailer.request_agreement_auth_email(email_recipient, agreement)
		end
end
