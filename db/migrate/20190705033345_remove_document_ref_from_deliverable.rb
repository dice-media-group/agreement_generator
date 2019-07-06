class RemoveDocumentRefFromDeliverable < ActiveRecord::Migration[6.0]
  def change
    remove_reference :deliverables, :document, null: false, foreign_key: true
  end
end
