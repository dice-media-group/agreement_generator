class UserMailer < ApplicationMailer
	def welcome_email(user)
		@user = user
		mail(to: @user.email, subject: 'Welcome to Dice Media Group')
	end

	def request_agreement_approval_email(email_recipient, agreement)
		@user		= email_recipient
		@agreement 	= agreement
		mail(to: @user.email, subject: "Dice Media Group Paperwork: #{@agreement.document.name}")		
	end
end
