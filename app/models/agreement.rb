class Agreement < ApplicationRecord
	require 'wicked_pdf'
  belongs_to 					:user
  belongs_to 					:document
  belongs_to 					:project

  has_many            :approval_requests
  has_many 						:deliverables, 			   inverse_of: :agreement
  has_many            :project_scopes,       through: :deliverables
  has_many 						:scheduled_payments, 	 inverse_of: :agreement
  has_many            :payment_schedules,    through: :scheduled_payments

  has_many 						:approvals, 			     as: :approvable
  has_many 						:users, 				       through: :approvals
  accepts_nested_attributes_for :deliverables, 			reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :scheduled_payments, 	reject_if: :all_blank, allow_destroy: true




end
