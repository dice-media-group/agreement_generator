json.extract! document, :id, :name, :main_body, :created_at, :updated_at
json.url document_url(document, format: :json)
