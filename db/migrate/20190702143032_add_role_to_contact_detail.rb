class AddRoleToContactDetail < ActiveRecord::Migration[6.0]
  def change
    add_column :contact_details, :role, :string
  end
end
