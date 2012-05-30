require 'bcrypt'

class User < ActiveRecord::Base
  has_many :groups, through: :memberships
  has_many :memberships
  has_one :coupon

  attr_reader :password
  attr_accessible :name, :email, :password
  attr_protected :password_digest

  validates :name, presence: true, length: { maximum: 50 } 
  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: valid_email_regex },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  def authenticate(unencrypted_password)
    if BCrypt::Password.new(password_digest) == unencrypted_password
      self
    else
      false
    end
  end

  def password=(unencrypted_password)
    @password = unencrypted_password
    unless unencrypted_password.blank?
      self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end
end
