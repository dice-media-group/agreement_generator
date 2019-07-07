class AddDescriptionToDeliverable < ActiveRecord::Migration[6.0]
  def change
    add_column :deliverables, :description, :string
  end
end
