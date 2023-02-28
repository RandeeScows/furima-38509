class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :move_to_index, except: [:index, :show] 
  before_action :validate_user, only: [:edit, :update]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(@item.user_id)
  end

  def edit
    @user = User.find(@item.user_id)
  end 

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end 

  def item_params
    params.require(:item).permit(
    :id, :name, :image, :price, :description, :category_id, :condition_id,
    :shipping_cost_on_id, :origin_id, :lead_time_id
    ).merge(user_id: current_user.id)
  end

  def validate_user
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
