json.extract! contact_detail, :id, :business_name, :street_address_01, :business_street_address_02, :business_city, :business_state, :business_postal_code, :business_phone, :name_of_representative, :created_at, :updated_at
json.url contact_detail_url(contact_detail, format: :json)
