class Customers::OrdersController < ApplicationController
  before_action :setup_item, only: [:destroy]

  def new
    @order = Order.new
  end

  def confirm
    
    @order = Order.new(order_params)
    if
    render 'new'
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      redirect_to order_path(@order.id)
    else
      @order = Order.new
      render 'new'
    end
  end

  def index
    @orders = Order.all
    @order = Order.new
    @customer = current_customer
  end

  def show
    @order = Order.find(params[:id])
    new_order.customer_id = current_customer.id
    new_order.save
  end

  def destroy
    @setup_item.destroy
    redirect_to current_cart
  end

  private

  def setup_item
    @setup_item = CartItem.find(params[:id])
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit()
  end
end
end