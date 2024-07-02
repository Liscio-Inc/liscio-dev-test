FactoryBot.define do
  factory :message_recipient do
    message { create(:message) }
    user { create(:user) }
  end
end
