class Building < ApplicationRecord
has_many :buildingables
has_many :users, through: :buildingables

enum toto: [:hirondelle, :tizzano, :menestrel]

#after_initialize :set_default_building, :if => :new_record?


end
