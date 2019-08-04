class AddPaymentScheduleRefToScheduledPayment < ActiveRecord::Migration[6.0]
  def change
    add_reference :scheduled_payments, :payment_schedule, null: true, foreign_key: true
  end
end
