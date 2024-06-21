# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  message    :string
#  edited_at  :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Message < ApplicationRecord
  has_many :message_participants
  has_many :users, through: :message_participants
end
