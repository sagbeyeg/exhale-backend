class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email_address, :password_digest
  has_many :journals
  has_many :tasks 
end
