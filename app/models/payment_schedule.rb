class PaymentSchedule < ApplicationRecord
  has_many 		:scheduled_payments, dependent: :destroy
  has_many 		:agreements, through: :scheduled_payments

end
