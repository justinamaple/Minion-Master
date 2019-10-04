class ItemsController < ApplicationController
  before_action :set_item

  def destroy
    @item.destroy
    redirect_to account_inventory_index_path current_user
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end
