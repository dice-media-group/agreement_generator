class Agreement < ApplicationRecord
  belongs_to 	:user
  belongs_to 	:document
  belongs_to 	:project

  has_many 		:deliverables, inverse_of: :agreement
  accepts_nested_attributes_for :deliverables, reject_if: :all_blank, allow_destroy: true
end
