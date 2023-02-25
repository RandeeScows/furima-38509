class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def create_table
    @item = Item.new(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :price, :description, :category_id, :condition_id, :shipping_cost_on_id, :origin_id, :lead_time_id).merge(user_id: current_user.id)
  end
end
