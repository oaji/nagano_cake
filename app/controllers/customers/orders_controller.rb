class Customers::OrdersController < ApplicationController
  before_action :setup_item, only: [:destroy]

  def index
    @orders = Order.all
    @order = Order.new
    @addresses = Address.all
    @customer = current_customer
  end

  def show
    @order = Order.find(params[:id])
    new_order.customer_id = current_customer.id
    new_order.save
  end

  def new
    @order = Order.new
    @address = Address.new
    @customer = current_customer
  end

  def confirm
    session[:order] = Order.new(order_params)
    session[:order][:customer_id] = current_customer.id
    if params[:any].to_i == 1
       session[:order][:post_code] = current_customer.post_code
       session[:order][:address] = current_customer.address
       session[:order][:name] = current_customer.family_name + current_customer.first_name
    elsif params[:any].to_i == 2
      address = Address.find(params[:order][:address])
       session[:order][:post_code] = address.post_code
       session[:order][:address] = address.customer_address
       session[:order][:name] = address.name
    else
      @address = Address.new(post_code: params[:order][:post_code], customer_address: params[:order][:customer_address], name: params[:order][:name])
      @address.customer_id = current_customer.id
      @address.save
      session[:order][:post_code] = @address.post_code
      session[:order][:address] = @address.customer_address
      session[:order][:name] = @address.name
    end
    session[:order][:customer_id] = current_customer.id
    session[:order][:how_to_pay] = order_params[:how_to_pay]
    @order = session[:order]
    @a = params[:order][:how_to_pay]
    @b = params[:order][:customer_address]
    @deliver_fee = 800
  end

  def complete
    @cart_item = CartItem.all
    @cart_item.destroy_all
  end

  def create
    @order = session[:order]
    @items = Item.all
    @deliver_fee = 800
    @order = Order.new
    redirect_to  orders_complete_path

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
    params.require(:order).permit(:post_code, :address, :name, :how_to_pay, :any)
  end
end