class JournalSerializer < ActiveModel::Serializer
  attributes :id, :title, :entry, :date, :user_id, :created_at
end
