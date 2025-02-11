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
class MessageRecipient < ApplicationRecord
  belongs_to :user
  belongs_to :message

  validates :user, presence: true
  validates :message, presence: true
end
