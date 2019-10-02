class AccountsController < ApplicationController
  before_action :set_account, only: %i[show edit update delete]
  before_action :check_login, only: %i[show edit update delete]
  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      flash[:primary] = "Log In Success!"
      redirect_to @account
    else
      flash[:secondary] = @account.errors.full_messages
      redirect_to new_account_path
    end
  end

  private

  def check_login
    if !logged_in?
      redirect_to accounts_path
    elsif current_user != @account
      redirect_to current_user
    end
  end

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:email, :password, :password_confirmation)
  end
end
