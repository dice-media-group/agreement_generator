class AddDocReferenceToContactDetails < ActiveRecord::Migration[6.0]
  def change
    add_reference :contact_details, :document, null: false, foreign_key: true
  end
end
