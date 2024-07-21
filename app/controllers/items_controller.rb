class ItemsController < ApplicationController
  def index
  end
  def new 
    @item = Item.new
  end 
  def create 
    @item = Item.create(item_params)
  end 


  private 
  def item_params 
    params.require(:item).permit(:item_name, :item_info, :category_id, :item_status_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
