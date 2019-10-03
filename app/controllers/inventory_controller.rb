class InventoryController < ApplicationController
  before_action :set_account
  before_action :check_login

  private

  def check_login
    if !logged_in?
      redirect_to accounts_path
    elsif current_user != @account
      redirect_to account_inventory_index_path current_user
    end
  end

  def set_account
    @account = Account.find(params[:account_id])
  end
end
