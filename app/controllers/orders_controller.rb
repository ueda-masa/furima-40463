class OrdersController < ApplicationController

    def index
      @item = Item.find(params[:item_id])

      if @item.order.present? || current_user.id == @item.user_id
        redirect_to root_path
      end
      
      @order = OrderForm.new
    end
  
    def create
      @item = Item.find(params[:item_id])
      @order = OrderForm.new(order_params)
      if @order.valid?
        @order.save
        return redirect_to root_path
      else
        render :index, status: :unprocessable_entity
      end
    end
  
    private

    def order_params
      params.require(:order_form).permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
    end
  
end
