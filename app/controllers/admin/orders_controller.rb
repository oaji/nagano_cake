class Admin::OrdersController < ApplicationController
  # before_action :admin_customer

  def index
  	@customer = Customer.all.order
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
  def admin_customer
  	redirect_to request.referrer
  end
end
