class AddProjectIdToAgreement < ActiveRecord::Migration[6.0]
  def change
    add_column :agreements, :project_id, :integer
  end
end
