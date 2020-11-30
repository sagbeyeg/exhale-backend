class User < ApplicationRecord
  has_many :journals
  has_many :tasks
  has_secure_password
  # validates :email_address, uniqueness: true
  validates :email_address, uniqueness: true
end
