class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :status, :content, :user_id
end
