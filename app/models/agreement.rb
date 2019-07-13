class Agreement < ApplicationRecord
  belongs_to 					:user
  belongs_to 					:document
  belongs_to 					:project

  has_many 						:deliverables, 			inverse_of: :agreement
  has_many 						:scheduled_payments, 	inverse_of: :agreement
  has_many 						:approvals, 			inverse_of: :agreement
  has_many 						:users, 				through: :approvals
  accepts_nested_attributes_for :deliverables, 			reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :scheduled_payments, 	reject_if: :all_blank, allow_destroy: true
end
