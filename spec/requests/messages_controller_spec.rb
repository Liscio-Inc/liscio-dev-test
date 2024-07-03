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

      response_body = JSON.parse(response.body)

      expect(response_body.last["sender"]["name"]).to eq(message_sender.name)
      expect(response_body.last["text"]).to eq(message_one.text)
    end
  end

  describe "GET /show" do
    let(:url) { "/messages/#{message_one.id}" }

    it "returns a success when called with messages" do
      get url

      expect(response).to have_http_status(:success)

      response_body = JSON.parse(response.body)

      expect(response_body["sender"]["name"]).to eq(message_sender.name)
      expect(response_body["text"]).to eq(message_one.text)
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

  describe "POST /create" do
    let(:url) { '/messages/' }
    let!(:user_receiver_2) { FactoryBot.create(:user, name: "Hicks") }
    let(:sample_message) { "hey y\'all, not sure how I feel about this trip to LV-426" }
    let(:params) do
      {
        text: sample_message,
        sender_id: message_sender.id,
        message_recipients: [user_receiver_2.id, user_receiver.id]
      }
    end
    let(:params_string) do
      {
        text: sample_message,
        sender_id: message_sender.id,
        message_recipients: "[#{user_receiver_2.id}, #{user_receiver.id}]"
      }
    end
    let(:params_wrong) do
      {
        texts: sample_message,
      }
    end
    let(:params_recipients_wrong) do
      {
        text: sample_message,
        sender_id: message_sender.id,
        message_recipients: "23243"
      }
    end

    it "returns a success when called with messages as array" do
      post url, params: params

      expect(response).to have_http_status(:success)

      response_body = JSON.parse(response.body)

      expect(response_body["sender"]["name"]).to eq(message_sender.name)
      expect(response_body["text"]).to eq(sample_message)
      expect(response_body["message_recipients"]).to contain_exactly({"user"=>{"name"=>user_receiver_2.name}}, {"user"=>{"name"=>user_receiver.name}})
    end

    it "returns a success when called with messages as string" do
      post url, params: params_string

      expect(response).to have_http_status(:success)

      response_body = JSON.parse(response.body)

      expect(response_body["sender"]["name"]).to eq(message_sender.name)
      expect(response_body["text"]).to eq(sample_message)
      expect(response_body["message_recipients"]).to contain_exactly({"user"=>{"name"=>user_receiver_2.name}}, {"user"=>{"name"=>user_receiver.name}})
    end

    it "returns a unprocessable entity when params are wrong" do
      post url, params: params_wrong

      expect(response).to_not be_successful
    end

    it "returns a unprocessable entity when recipient params are wrong" do
      post url, params: params_recipients_wrong

      expect(response).to_not be_successful
    end
  end
end
