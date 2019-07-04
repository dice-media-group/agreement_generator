class Document < ApplicationRecord
	has_many :contact_details, dependent: :destroy
end
