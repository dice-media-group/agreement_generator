# authorization for agreements
class Agreements::AuthorizationRequestsController < ApplicationController
  	before_action :authenticate_user!
	before_action :set_agreement
	def new
		
	end

	def create
		@project = @agreement.project

    	if User.find(params[:recipient_id])
    		@recipient = User.find(params[:recipient_id])
			authorization_request = @agreement.authorization_requests.new(authorization_request_params)
			mail_authorization_request(@recipient, @agreement)
			if authorization_request.save
				redirect_to :root, notice: 	"Success"
			else
				redirect_to :root, alert: 	"Failure"
			end		
    	else
			redirect_to :root, alert: 	"Failure"
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
