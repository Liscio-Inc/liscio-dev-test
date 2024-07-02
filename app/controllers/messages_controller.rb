class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
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

    respond_to do |format|
      if @message.save
        render :show, status: :created, json: @message
      else
        render json: @message.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy!

    respond_to do |format|
      format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(
        :message, :sender_id
      )
    end
end
