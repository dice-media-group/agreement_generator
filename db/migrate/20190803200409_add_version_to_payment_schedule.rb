class AddVersionToPaymentSchedule < ActiveRecord::Migration[6.0]
  def change
    add_column :payment_schedules, :version, :string
  end
end
