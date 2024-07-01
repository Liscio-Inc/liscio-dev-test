# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  message    :string           not null
#  sender_id  :bigint
#  edited_at  :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MessageSerializer < ActiveModel::Serializer
  attributes :id, :message, :sender, :created_at
end
