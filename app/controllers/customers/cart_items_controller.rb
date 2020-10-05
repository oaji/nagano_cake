class Customers::CartItemsController < ApplicationController
  def index
  end

  def create

  	@cart_item = current_customer.cart_items.new(params_cart_item)

    if @cart_item.save
      flash[:notice] = "#{@cart_item.item.name}をカートに追加しました"
      redirect_to cart_items_path
    else
      @item = Item.find(params[:cart_item][:item_id])
      @cart_item = CartItem.new
      flash[:alert] = "個数を選択してください"
      render ("customer/items/show")
    end

  end

  def edit
  end

  def update
  end


  private

  def params_cart_item
  	params.require(:cart_item).permit(:customer_id, :quantity, :item_id, :price)
  end


end
