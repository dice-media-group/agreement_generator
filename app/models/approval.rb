class Approval < ApplicationRecord
  belongs_to :agreement
  belongs_to :user

  ## should be has_many :through
  ## Like doctor has many patients through appointments
  ## https://gist.github.com/kcurbelo/a1395d64b5a01fb56b03
  ## Agreement has many users through approvals
  ## User has many agreements through approvals
end
