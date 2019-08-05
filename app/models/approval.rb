class Approval < ApplicationRecord
  validates :signature, :presence => true
  belongs_to :approvable, polymorphic: true
  # belongs_to :agreement
  belongs_to :user

  ## below states that Approval should be part of has_many :through,
  ## joining agreement with User.  Approval can belong to more than Agreement.
  ## has_many :through will not logically work with :through.
  ##

  ## should be has_many :through
  ## Like doctor has many patients through appointments
  ## https://gist.github.com/kcurbelo/a1395d64b5a01fb56b03
  ## Agreement has many users through approvals
  ## User has many agreements through approvals
end
