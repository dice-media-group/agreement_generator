class ApprovalRequest < ApplicationRecord
  belongs_to :recipient, foreign_key: :recipient_id, class_name: "User"
  belongs_to :agreement

  before_validation :email_request, if: :recipient_id?

  def email_request
  	Rails.logger.info "Attempting rails ApprovalRequest.email_request"
  	@recipient = User.find(self.recipient_id)
  	agreement = Agreement.find(self.agreement_id)
  	Rails.logger.info "agreement: #{agreement}, recipient: #{@recipient}"

	# message 	= UserMailer.request_agreement_approval_email(recipient, agreement)
	user = User.first
	UserMailer.welcome_email(user).deliver_now
	# UserMailer.with(user: User.first).welcome_email.deliver_now


  end

end
