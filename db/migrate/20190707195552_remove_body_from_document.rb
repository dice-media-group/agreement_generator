class RemoveBodyFromDocument < ActiveRecord::Migration[6.0]
  def change

    remove_column :documents, :main_body, :text
  end
end
