class Deliverable < ApplicationRecord
  belongs_to :document
  belongs_to :agreement
end
