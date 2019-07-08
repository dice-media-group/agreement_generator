class AddClientOrganizationToAgreement < ActiveRecord::Migration[6.0]
  def change
    add_column :agreements, :client_organization, :string
  end
end
