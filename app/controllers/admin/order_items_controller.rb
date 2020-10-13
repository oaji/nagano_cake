class Admin::OrderItemsController < ApplicationController

	def update
  	@order = Order.find(params[:id])
  	@order_items = @order.order_items
    @order.update(order_item_params)
  	  if @order.order_status == "着手不可"
         @order.order_status.update_all(order_status:0)
       elsif @order.order_status == "製作待ち"
         @order.order_status.update_all(order_status:1)
       elsif @order.order_status == "製作中"
         @order.order_status.update_all(order_status:2)
       elsif @order.order_status == "製作完了"
         @order.order_status.update_all(order_status:3)
      end
	       redirect_to request.referer
  end

  private
  def order_item_params
  	params.require(:order_item).permit(:quantity, :order_status)
  end

end


