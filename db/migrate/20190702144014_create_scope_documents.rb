class CreateScopeDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :scope_documents do |t|
      t.string :project_name
      t.belongs_to :document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
