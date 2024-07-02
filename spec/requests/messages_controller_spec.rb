require 'rails_helper'

RSpec.describe "MessagesControllers", type: :request do
  # let!(:message_recipient) { FactoryBot.create(:message_recipient)}
  let!(:message_one) { FactoryBot.create(:message) }
  let!(:user_receiver) { FactoryBot.create(:user, name: "Newt") }
  let!(:message_recipient) { FactoryBot.create(:message_recipient, message: message_one, user: user_receiver) }

  describe "GET /index" do
    let(:url) { '/messages/' }

    it "returns a success when called with messages" do
      get url

      expect(response).to have_http_status(:success)
      expect()
    end
  end
end
