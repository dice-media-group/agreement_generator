class AddProjectScopeToDeliverables < ActiveRecord::Migration[6.0]
  def change
    add_reference :deliverables, :project_scope, null: false, foreign_key: true
  end
end
