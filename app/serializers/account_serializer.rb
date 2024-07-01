class AccountSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :company_type, :address, :users

  def users
    object.users
  end
end
