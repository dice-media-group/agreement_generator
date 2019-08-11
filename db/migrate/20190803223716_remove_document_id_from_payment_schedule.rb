class RemoveDocumentIdFromPaymentSchedule < ActiveRecord::Migration[6.0]
  def change

    remove_column :payment_schedules, :document_id, :integer
  end
end
