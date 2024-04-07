class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      redirect_to root_path, notice: 'Item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end
  


def edit
  if @item.sold_out? || current_user.id != @item.user_id
    redirect_to root_path
  end
end

def update
  if @item.update(item_params)
    redirect_to item_path(@item)
  else
    puts @item.errors.full_messages
    render :edit, status: :unprocessable_entity
  end
end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :shipping_day_id, :price)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
