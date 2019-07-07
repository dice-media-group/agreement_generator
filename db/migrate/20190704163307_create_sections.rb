class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.string :title
      t.text :body
      t.boolean :boilerplate_text

      t.timestamps
    end
  end
end
