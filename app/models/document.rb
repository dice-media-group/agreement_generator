class Document < ApplicationRecord
	has_rich_text :main_body
	has_many :contact_details, dependent: :destroy
end
