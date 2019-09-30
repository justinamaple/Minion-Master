class AccountsController < ApplicationController
  def index
    @account = Account.new
  end
end
