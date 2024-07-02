# == Schema Information
#
# Table name: message_recipients
#
#  id         :bigint           not null, primary key
#  message_id :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MessageRecipientSerializer < ActiveModel::Serializer
  attributes :user

  def user
    {
      "name": object.user.name
    }
  end
end
