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
  attributes :id, :message, :sender, :created_at, :message_recipients

  def message_recipients
    MessageRecipientSerializer.new(object.message_recipients)
  end
end
