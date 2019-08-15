# authorization for agreements
class Agreements::ApprovalRequestsController < ApplicationController
  	before_action :authenticate_user!
	before_action :set_agreement

  layout        "crm_docs"

	def new
		@project = @agreement.project
		@project_membership = ProjectUser.where(project: @project, user: current_user).first

		
	end

	def create
		@project = @agreement.project

    	if User.find(params[:approval_request][:recipient_id])
    		@recipient = User.find(params[:approval_request][:recipient_id])
			@approval_request = @agreement.approval_requests.new(approval_request_params)
# 
		    respond_to do |format|
		      if @agreement.save
				# UserMailer.with(user: @recipient).welcome_email.deliver_now
		        format.html { redirect_to @approval_request.agreement.project, notice: 'Reqest for approval was successfully sent.' }
		        format.json { render :show, status: :created, location: @agreement }
		      else
		        format.html { render :new }
		        format.json { render json: @agreement.errors, status: :unprocessable_entity }
		      end
		    end
# 

    	else
        	redirect_to :root, notice: 'Reqest for approval failed.'
    	end


	end

	private

		def set_agreement
			@agreement = Agreement.find(params[:agreement_id])
		end

		def approval_request_params
			params.require(:approval_request).permit(:recipient_id)
		end
end
