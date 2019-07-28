class CreateAuthorizationRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :authorization_requests do |t|
      t.references :agreement, index: true
      t.references :recipient, index: true

      t.timestamps
    end
  end
end
