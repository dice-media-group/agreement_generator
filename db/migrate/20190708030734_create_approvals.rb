class CreateApprovals < ActiveRecord::Migration[6.0]
  def change
    create_table :approvals do |t|
      t.belongs_to :agreement, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
