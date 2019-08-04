class ProjectScope < ApplicationRecord
  has_many 		:deliverables, dependent: :destroy
  has_many 		:agreements, through: :deliverables	
end
