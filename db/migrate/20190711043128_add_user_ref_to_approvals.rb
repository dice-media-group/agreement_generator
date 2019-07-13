class AddUserRefToApprovals < ActiveRecord::Migration[6.0]
  def change
    add_reference :approvals, :user, null: false, foreign_key: true
  end
end
