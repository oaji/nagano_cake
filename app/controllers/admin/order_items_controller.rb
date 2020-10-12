class Admin::OrderItemsController < ApplicationController

	def update
  	@order_item = OrderItem.find(params[:id])
  	@order_items = @order_item.order_items
    @order_item.update(order_item_params)
  	  if @order_item.order_status == 0
         @order.order_status.update_all(order_status:0)
       elsif @order_item.order_status == 1
         @order.order_status.update_all(order_status:1)
       elsif @order_item.order_status == 2
         @order.order_status.update_all(order_status:2)
       elsif @order_item.order_status == 3
         @order.order_status.update_all(order_status:3)
      end
	       redirect_to admin_order_path(@order.id)
  end

  private
  def order_item_params
  	params.permit(:quantity, :order_status)
  end

end
