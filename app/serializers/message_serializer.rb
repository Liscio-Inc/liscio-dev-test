# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  text       :string           not null
#  sender_id  :bigint
#  edited_at  :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MessageSerializer < ActiveModel::Serializer
  attributes :id, :text, :sender, :created_at, :edited_at
  has_many :message_recipients
end
