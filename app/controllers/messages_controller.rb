class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_message, only: %i[ show edit update destroy ]

  # GET /messages or /messages.json
  def index
    @messages = Message.all

    render json: @messages
  end

  # GET /messages/1 or /messages/1.json
  def show
    @message = Message.find(params[:id])

    render json: @message
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
  end


  # POST /messages or /messages.json
  def create
    @message = Message.new(message_params)

    if @message.save
      render :show, status: :created, json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy!

    render json: { head: :no_content }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:text)
      params.require(:sender_id)
      params.permit(
        :text,
        :sender_id
      )
    end
end
