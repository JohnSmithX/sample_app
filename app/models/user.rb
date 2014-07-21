class User < ActiveRecord::Base
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([a-z0-9\_]+)@([a-z0-9]+\.+[a-z]+)\z/i }
  validates :password, length: { minimum: 6 }
  has_secure_password

  validate
end
