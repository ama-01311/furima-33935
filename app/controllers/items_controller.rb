class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.includes(:user).order("created_at DESC")
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
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item)
          .permit(:item_name, :item_description, :item_category_id, :item_state_id,
                  :delivery_side_id, :delivery_prefecture_id, :delivery_days_id,
                  :selling_price, :image)
          .merge(user_id: current_user.id)
  end
end
