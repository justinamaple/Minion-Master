class ItemsController < ApplicationController
  before_action :set_item

  def equip
    @character = Character.find(params[:character_id])
    @equips = @character.equipment
    @inventory = Account.find(params[:account_id]).inventory

    @equips.items.find_by(slot: @item.slot).update(inside: @inventory)
    @item.update(inside: @equips)

    redirect_to account_character_path(current_user, @character)
  end

  def destroy
    @item.destroy
    redirect_to account_inventory_index_path current_user
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end
