class AddAgreementRefToPayment < ActiveRecord::Migration[6.0]
  def change
    add_reference :payments, :agreement, null: false, foreign_key: true
  end
end
