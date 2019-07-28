# authorization for agreements
class Agreements::ApprovalRequestsController < ApplicationController
  	before_action :authenticate_user!
	before_action :set_agreement
	def new
		@project = @agreement.project
		@project_membership = ProjectUser.where(project: @project, user: current_user).first

		
	end

	def create
		@project = @agreement.project

    	if User.find(params[:approval_request][:recipient_id])
    		@recipient = User.find(params[:approval_request][:recipient_id])
			@approval_request = @agreement.approval_requests.new(approval_request_params)
			mail_approval_request_params(@recipient, @agreement)
			if @approval_request.save
				UserMailer.request_agreement_approval_email(email_recipient, agreement)
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

		def approval_request_params
			params.require(:approval_request).permit(:recipient_id)
		end

		def mail_approval_request_params(email_recipient, agreement)
			UserMailer.request_agreement_approval_email(email_recipient, agreement)
		end
end
