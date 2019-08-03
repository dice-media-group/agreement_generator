class ScheduledPayment < ApplicationRecord
  belongs_to :agreement
  belongs_to :payment_schedule
end
