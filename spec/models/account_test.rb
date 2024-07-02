# == Schema Information
#
# Table name: accounts
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  address      :string
#  company_type :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "rails_helper"

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
