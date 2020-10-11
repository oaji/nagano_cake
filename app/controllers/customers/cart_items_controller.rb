class Customers::CartItemsController < ApplicationController
before_action :authenticate_customer!

  before_action:authenticate_customer!,except:[:index]

	def index
		@cart_items = CartItem.all
	end



  	def create
  		@cart_item = current_customer.cart_items.new(cart_item_params)

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

  	def update#カート内商品データ更新
  		@cart_items = CartItem.all
  		@cart_item = CartItem.find(params[:id])
    	@cart_item.update(quantity:params[:cart_item][:quantity].to_i)
	end


	def destroy #一点消す
		@cart_items = CartItem.all
		@cart_item = CartItem.find(params[:id])
    @cart_item.destroy
	end

	def destroy_all #カート内商品全消し
		@cart_items = CartItem.all
		@cart_items.destroy_all
	end



	private



  def cart_item_params
  	params.require(:cart_item).permit(:customer_id, :quantity, :item_id, :price)
  end


end

