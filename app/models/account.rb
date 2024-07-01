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
class Account < ApplicationRecord
  validates :name, presence: true
  validates :company_type, presence: true

  enum company_type: {accounting_firm: "accounting firm", bookkeeper: "bookkeeper"}

  has_many :users
end
