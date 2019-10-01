class CharactersController < ApplicationController
  def index
    @account = Account.find(params[:account_id])
    @characters = @account.characters
  end
  
  def show
    @account = Account.find(params[:account_id])
    @character = @account.characters.find(params[:id])
  end
end
