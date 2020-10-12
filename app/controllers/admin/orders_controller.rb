class Admin::OrdersController < ApplicationController


  def index
  	@orders = Order.page(params[:page])
  end

  def show
  	@order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
  	@order = Order.find(params[:id])
    @order_items = @order.order_items
    @order.update(order_params)
  	  if @order.order_status == 0
         @order_items.order_status.update_all(order_status:0)
       elsif @order.order_status == 1
         @order_items.order_status.update_all(order_status:1)
       elsif @order.order_status == 2
         @order_items.order_status.update_all(order_status:2)
       elsif @order.order_status == 3
         @order_items.order_status.update_all(order_status:3)
      end
	       redirect_to admin_order_path(@order.id)
  end

  private
  def order_params
  	params.permit(:created_at, :name, :quantity, :order_status)
  end

end
