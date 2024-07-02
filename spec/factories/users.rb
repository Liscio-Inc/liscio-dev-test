FactoryBot.define do
  factory :user do
    name { "Ellen Ripley" }
    account {create(:account)}
  end
end
