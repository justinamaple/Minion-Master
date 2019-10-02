class CharactersController < ApplicationController
  before_action :check_login
  before_action :set_account

  def index
    @characters = @account.characters
    @character = Character.new
    @character.gender = nil
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    @character.account = @account
    @character.level = 1
    if @character.save
      flash[:primary] = "Character Created!"
      redirect_to account_characters_path
    else
      flash[:secondary] = @character.errors.full_messages
      redirect_to account_characters_path
    end
  end

  def show
    @account = Account.find(params[:account_id])
    @character = @account.characters.find(params[:id])
  end

  private

  def check_login
    redirect_to accounts_path unless logged_in?
  end

  def set_account
    @account = Account.find(params[:account_id])
  end

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :race, :gender)
  end
end
