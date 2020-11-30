class User < ApplicationRecord
  has_many :journals, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_secure_password
  # validates :email_address, uniqueness: true
  validates :email_address, uniqueness: true
end
