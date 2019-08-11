class CreateProjectScopes < ActiveRecord::Migration[6.0]
  def change
    create_table :project_scopes do |t|
      t.string :version

      t.timestamps
    end
  end
end
