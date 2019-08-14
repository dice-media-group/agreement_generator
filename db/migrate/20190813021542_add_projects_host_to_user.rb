class AddProjectsHostToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :projects_host, :boolean, null: false, default: false
  end
end
