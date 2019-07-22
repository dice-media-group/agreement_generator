class AddRoleToProjectUser < ActiveRecord::Migration[6.0]
  def change
    add_column :project_users, :role, :string
  end
end
