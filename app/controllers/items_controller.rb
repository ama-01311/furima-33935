class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:create, :show, :edit, :update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show

  end

  def edit
    redirect_to action: :index unless user_signed_in? && current_user.id == @item.user_id
  end

  def update
    redirect_to action: :index unless user_signed_in? && current_user.id == @item.user_id
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item)
          .permit(:item_name, :item_description, :item_category_id, :item_state_id,
                  :delivery_side_id, :delivery_prefecture_id, :delivery_days_id,
                  :selling_price, :image)
          .merge(user_id: current_user.id)
  end
end
