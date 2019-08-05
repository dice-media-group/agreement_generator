class AddApprovableToApproval < ActiveRecord::Migration[6.0]
  def change
    add_column :approvals, :approvable_type, :string
    add_column :approvals, :approvable_id, :integer
  end
end
