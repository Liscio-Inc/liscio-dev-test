# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  account_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
