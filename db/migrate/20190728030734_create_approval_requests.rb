class CreateApprovalRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :approval_requests do |t|
      t.belongs_to :agreement, null: false, foreign_key: true
      t.references :recipient, index: true

      t.timestamps
    end
  end
end
