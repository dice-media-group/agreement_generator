class CreatePaymentSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_schedules do |t|
      t.belongs_to :document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
