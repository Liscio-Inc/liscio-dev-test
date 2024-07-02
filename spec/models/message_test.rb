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
require "rails_helper"

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
