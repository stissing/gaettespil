class Group < ActiveRecord::Base
  has_many :users, through: :memberships
  has_many :memberships

  attr_accessible :name, :password
  
  validates :name, :password, presence: true, length: { maximum: 50, minimum: 1 } 
  validates :name, uniqueness: { case_sensitive: true }
end
