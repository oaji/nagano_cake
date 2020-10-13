class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!


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
  	  if @order.order_status == "入金待ち"
         @order_items.update_all(order_status:0)
       elsif @order.order_status == "入金確認"
         @order_items.update_all(order_status:1)
       elsif @order.order_status == "製作中"
         @order_items.update_all(order_status:2)
       elsif @order.order_status == "発送準備中"
         @order_items.update_all(order_status:3)
      end

      redirect_to request.referer

  end

  private
  def order_params
  	params.require(:order).permit(:created_at, :name, :quantity, :order_status)
  end

end
