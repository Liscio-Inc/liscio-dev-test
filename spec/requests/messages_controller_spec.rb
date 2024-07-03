require 'rails_helper'

RSpec.describe "MessagesControllers", type: :request do
  let!(:message_sender) { FactoryBot.create(:user)}
  let!(:message_one) { FactoryBot.create(:message, user: message_sender) }
  let!(:user_receiver) { FactoryBot.create(:user, name: "Newt") }
  let!(:message_recipient) { FactoryBot.create(:message_recipient, message: message_one, user: user_receiver) }

  describe "GET /index" do
    let(:url) { '/messages/' }

    it "returns a success when called with messages" do
      get url

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).last["sender"]["name"]).to eq(message_sender.name)
      expect(JSON.parse(response.body).last["text"]).to eq(message_one.text)
    end
  end

  describe "GET /show" do
    let(:url) { "/messages/#{message_one.id}" }

    it "returns a success when called with messages" do
      get url

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["sender"]["name"]).to eq(message_sender.name)
      expect(JSON.parse(response.body)["text"]).to eq(message_one.text)
    end
  end

  describe "GET /new" do
    let(:url) { "/messages/new" }

    it "returns a success when called with messages" do
      get url

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["id"]).to be_nil
    end
  end


  describe "DELETE /show" do
    let(:url) { "/messages/#{message_one.id}" }

    it "returns a success when called with messages" do
      delete url

      current_message_id = message_one.id

      expect(response).to have_http_status(:success)
      expect(Message.where(id: current_message_id)).to be_empty
    end
  end
end
