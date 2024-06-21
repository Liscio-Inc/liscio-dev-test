# == Schema Information
#
# Table name: message_participants
#
#  id         :bigint           not null, primary key
#  message_id :bigint
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MessageParticipant < ApplicationRecord
  belongs_to :users
end
