class Admin::OrdersController < ApplicationController
  # before_action :admin_customer

  def index
  	@order_items = OrderItem.all
    @order_item = OrderItem.new
  end

  def show
  	@order_item = OrderItem.find(params[:id])
  end

  def update
  	@order_item = OrderItem.find(params[:id])
  	@order_item.update(params[:id])
	  redirect_to addmins_orders_path

  end

  private
  def order_params
  	params.require(:order).permit(:order_status)
  end
end
