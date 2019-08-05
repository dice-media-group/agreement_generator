class RemoveAgreementIdFromApprovals < ActiveRecord::Migration[6.0]
  def change

    remove_column :approvals, :agreement_id, :integer
  end
end
