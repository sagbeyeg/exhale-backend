class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email_address 
  has_many :journals
  has_many :tasks 
end
