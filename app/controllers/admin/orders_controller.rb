class Admin::OrdersController < ApplicationController


  def index
  	@orders = Order.page(params[:page])
  end

  def show
  	@order = Order.find(params[:id])
  end

  def update
  	@order = Order.find(params[:id])
  	if @order.update(order_params)
	  redirect_to addmins_orders_path
    end
  end

  private
  def order_params
  	params.require(:order).permit(:created_at, :name, :quantity, :order_status)
  end
end
