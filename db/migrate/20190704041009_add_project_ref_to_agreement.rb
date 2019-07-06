class AddProjectRefToAgreement < ActiveRecord::Migration[6.0]
  def change
    add_reference :agreements, :project, null: false, foreign_key: true
  end
end
