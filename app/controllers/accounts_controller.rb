class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]

  # GET /accounts or /accounts.json
  def index
    @accounts = Account.all
    render json: @accounts
  end

  # GET /accounts/1 or /accounts/1.json
  def show
    @account = Account.find(params[:id])
    render json: @account
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts or /accounts.json
  def create
    @account = Account.new(account_params)

    if @account.save
      render :show, status: :created, json: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    if @account.update(account_params)
      render :show, status: :created, json: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account.destroy!

    render json: { head: "Account deleted!" }
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def account_params
    params.require(:account).permit(
      :name, :company_type, :address
    )
  end
end
