# frozen_string_literal: true
require 'random_name_generator'

class CharactersController < ApplicationController
  before_action :set_account
  before_action :set_character, only: %i[show edit update destroy]
  before_action :character_items, only: :show
  before_action :check_login

  def index
    @characters = @account.characters.order('id ASC')
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
      flash[:primary] = ['Character Created!']
      @character.create_equipment
      randomize_equipment
    else
      flash[:secondary] = @character.errors.full_messages
    end
    redirect_to account_characters_path
  end

  def show
    @rarity_color = {
      0 => 'border-dark',
      1 => 'border-success',
      2 => 'border-info',
      3 => 'border-primary',
      4 => 'border-danger'
    }
  end

  def update
    @character.update(character_params)
    redirect_to account_characters_path
  end

  def destroy
    @character.destroy
    redirect_to account_characters_path
  end

  private

  def check_login
    if !logged_in?
      redirect_to accounts_path
    elsif current_user != @account
      redirect_to account_characters_path current_user
    end
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

  def randomize_equipment
    lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod."
    rng = RandomNameGenerator.new

    slots = %w[Weapon Armor Pet]
    slots.each do |slot|
      @character.equipment.items.create(
        name: rng.compose(3),
        slot: slot,
        rarity: rand(0..4),
        description: lorem
      )
    end
  end

  def character_items
    items = @character.equipment.items
    @weapon = items.find_by(slot: "Weapon")
    @armor = items.find_by(slot: "Armor")
    @pet = items.find_by(slot: "Pet")
  end
end
