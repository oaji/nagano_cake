class Admin::OrderItemsController < ApplicationController


	def update
  	@order_item = OrderItem.find(params[:id])
  	@order = @order_item.order
  	@order_items = @order.order_items
    @order_item.order_status = params[:order_item]["order_status"]
    if @order_item.save!
  	  if @order_items.all?{|order_item| order_item.order_status == "着手不可"}
         @order.update(order_status:0)
       elsif @order_items.all?{|v| v.order_status == "製作待ち"}
         @order.update(order_status:1)
         flash[:status] = "ステータスを更新しました"
       elsif @order_items.all?{|v| v.order_status == "製作中"}
       	@order.update(order_status:2)
       	flash[:status] = "ステータスを更新しました"
       elsif @order_items.all?{|v| v.order_status == "製作完了"}
         @order.update(order_status:3)
         flash[:status] = "ステータスを更新しました"
      end
     end
	     redirect_to admin_order_path(@order)
  end

  private
  def order_item_params
  	params.require(:order_item).permit(:quantity, :order_status)
  end

end


