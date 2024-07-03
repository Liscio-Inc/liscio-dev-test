require 'rails_helper'

RSpec.describe Message, type: :model do
  subject(:message) { FactoryBot.create(:message, text: "This is my first message") }

  it { should validate_presence_of(:text) }
  it { should validate_presence_of(:user) }

  it "returns the user when calling sender" do
    expect(subject.sender).to eq(subject.user)
  end
end
