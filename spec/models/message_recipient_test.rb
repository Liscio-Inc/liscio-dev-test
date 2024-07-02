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
require "rails_helper"

class MessageRecipientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
