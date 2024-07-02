FactoryBot.define do
  factory :message do
    text { "" }
    user { create(:user) }
  end
end
