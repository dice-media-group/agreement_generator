class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.date :date
      t.decimal :amount

      t.timestamps
    end
  end
end
