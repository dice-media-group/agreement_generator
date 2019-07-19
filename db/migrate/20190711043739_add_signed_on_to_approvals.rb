class AddSignedOnToApprovals < ActiveRecord::Migration[6.0]
  def change
    add_column :approvals, :signed_on, :datetime
  end
end
