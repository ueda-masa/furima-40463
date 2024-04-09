class OrdersController < ApplicationController

    def index
      @order = OrderForm.new
    end
  
    def create
      @order = OrderForm.new(order_params)
      if @order.valid?
        @order.save
        return redirect_to root_path
      else
        render 'index', status: :unprocessable_entity
      end
    end
  
    private
  
    def order_params
      params.require(:order_form).permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
    end
  end
end

