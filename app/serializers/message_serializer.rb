class MessageSerializer < ActiveModel::Serializer
  attributes :id, :message, :sender, :created_at
end
