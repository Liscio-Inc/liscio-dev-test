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
class Message < ApplicationRecord
  belongs_to :user, foreign_key: :sender_id
  has_many :message_recipients, dependent: :destroy
  has_many :users, through: :message_recipients

  validates :user, presence: true
  validates :text, presence: true

  def message_participants
  end

  def sender
    user
  end
end
