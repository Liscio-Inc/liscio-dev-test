FactoryBot.define do
  factory :message do
    text { "This is a sample text" }
    user { create(:user) }
  end
end
