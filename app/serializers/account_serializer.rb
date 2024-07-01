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
class AccountSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :company_type, :address, :users

  def users
    object.users
  end
end
