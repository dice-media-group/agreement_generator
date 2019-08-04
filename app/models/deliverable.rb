class Deliverable < ApplicationRecord
  belongs_to :agreement
  belongs_to :project_scope
end
