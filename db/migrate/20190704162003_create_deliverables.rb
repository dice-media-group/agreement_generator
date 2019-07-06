class CreateDeliverables < ActiveRecord::Migration[6.0]
  def change
    create_table :deliverables do |t|
      t.belongs_to :document, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
