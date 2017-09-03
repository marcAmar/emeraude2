class Building < ApplicationRecord
has_many :buildingables
has_many :users, through: :buildingables

validates :name, :presence => true, format: { with: /\A[a-zA-Z0-9_ ]{2,20}\z/,
            message: 'ne doit contenir que des caractères alpha-numériques'},
            uniqueness: {case_sensitive: false}

validates :description, :presence => true, format: { with: /\A[a-zA-Z0-9_ ]{2,20}\z/,
                        message: 'ne doit contenir que des caractères alpha-numériques'},
                        uniqueness: {case_sensitive: false}
#after_initialize :set_default_building, :if => :new_record?






end
