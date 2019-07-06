class AddAgreementRefToDeliverables < ActiveRecord::Migration[6.0]
  def change
    add_reference :deliverables, :agreement, null: false, foreign_key: true
  end
end
