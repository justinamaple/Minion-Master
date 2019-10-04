require 'random_name_generator'

class AccountsController < ApplicationController
  before_action :set_account, only: %i[show edit update delete]
  before_action :check_login, only: %i[show edit update delete]

  def index
    redirect_to current_user if logged_in?
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      flash[:primary] = "Account Created!"
      generate_inventory
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

  def generate_inventory
    lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod."
    rng = RandomNameGenerator.new

    @account.create_inventory
    slots = %w[Weapon Armor Pet]
    5.times do
      @account.inventory.items.create(name: rng.compose(3), slot: slots.sample, rarity: rand(0..4), description: lorem)
    end
  end
end
