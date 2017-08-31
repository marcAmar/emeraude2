class Buildingable < ApplicationRecord
  belongs_to :user
  belongs_to :building
end
