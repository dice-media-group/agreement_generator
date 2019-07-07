class CreateScheduledPayments < ActiveRecord::Migration[6.0]
  def change
    create_table :scheduled_payments do |t|
      t.date :due_date
      t.decimal :amount
      t.belongs_to :agreement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
