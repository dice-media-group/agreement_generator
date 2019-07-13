class AddSignatureToApprovals < ActiveRecord::Migration[6.0]
  def change
    add_column :approvals, :signature, :binary
  end
end
