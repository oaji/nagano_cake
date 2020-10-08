class Admin::OrdersController < ApplicationController
  # before_action :admin_customer

  def index
  	@orders = Order.page(params[:page])
  end

  def show
  	@order = Order.find(params[:id])
  end

  def update
  	@order = Order.find(params[:id])
  	@order.update(params[:id])
	  redirect_to addmins_orders_path
  end

  private
  def order_params
  	params.require(:order).permit(:created_at, :name, :quantity, :order_status)
  end
end
