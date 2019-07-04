class CreateAgreements < ActiveRecord::Migration[6.0]
  def change
    create_table :agreements do |t|
      t.string :provider_rep_name
      t.text :provider_signature
      t.date :provider_signed_on
      t.string :client_rep_name
      t.text :client_rep_signature
      t.date :client_signed_on
      t.binary :signature
      t.datetime :signed_on
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
