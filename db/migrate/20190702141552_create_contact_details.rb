class CreateContactDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_details do |t|
      t.string :business_name
      t.string :street_address_01
      t.string :business_street_address_02
      t.string :business_city
      t.string :business_state
      t.string :business_postal_code
      t.string :business_phone
      t.string :name_of_representative

      t.timestamps
    end
  end
end
