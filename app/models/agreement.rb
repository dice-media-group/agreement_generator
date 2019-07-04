class Agreement < ApplicationRecord
  belongs_to :user
  belongs_to :document
  belongs_to :project
end
