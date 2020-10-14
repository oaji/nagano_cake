class Customers::OrdersController < ApplicationController
  before_action :setup_item, only: [:destroy]

  def index
    #@orders = Order.where(customer_id:current_customer.id)
    @orders = current_customer.orders.page(params[:page]).reverse_order
    @order = Order.new
    @addresses = Address.all
    @order_items = @order.order_items
    @customer = current_customer
  end

  def show
    @order = Order.find(params[:id])
    @order_item = @order.order_items
    @order_new = Order.new
    @customer = @order.customer
    @sum = 0
    @order.order_items.each do |s|
      @sum += s.price * s.quantity
    end
  end

  def new
    @order = Order.new
    @address = Address.new
    @customer = current_customer
    if current_customer.cart_items.empty?
      redirect_to root_path
    end
  end

  def confirm
    if params[:order][:how_to_pay] == nil
      errors = ""
      errors = "支払い方法を選択して下さい<br>"
    end
    if params[:any] == nil
      errors = ""
      errors += "配送先住所を選択して下さい"
    end
    if errors
      redirect_to new_order_path, notice: errors
      return
    end
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
    session[:order][:deliver_fee] = 800
    @deliver_fee = 800
    @order = session[:order]
    if @order.name.blank? or
       @order.post_code.blank? or
       @order.address.blank?
       redirect_to new_order_path
    end
  end

  def complete
    @cart_item = CartItem.all
    @cart_item.destroy_all
  end

  def create
    @order = Order.new(session[:order])
    @order.total_payment = params[:order][:total_payment]
    @items = Item.all
    @order.save!
    order_item = []
      @order_items = current_customer.cart_items
        @order_items.each do |i|
          order_item << @order.order_items.build(item_id: i.item_id, quantity: i.quantity, order_status: 1, price: i.item.price)
        end
      OrderItem.import order_item
    redirect_to orders_complete_path
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
    params.require(:order).permit(:post_code, :address, :name, :how_to_pay, :any, order_items_attributes: [:quantity])
  end
end