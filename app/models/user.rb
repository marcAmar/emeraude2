class User < ApplicationRecord
  has_many :buildingables
  has_many :buildings, through: :buildingables

  enum role: [:user, :vip, :admin]



  after_initialize :set_default_role, :if => :new_record?


  def set_default_role
    self.role ||= :user
  end



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
