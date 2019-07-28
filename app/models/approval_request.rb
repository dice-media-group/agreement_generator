class ApprovalRequest < ApplicationRecord
  belongs_to :recipient, foreign_key: :recipient_id, class_name: "User"
  belongs_to :agreement
end
