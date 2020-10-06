class Customers::CartItemsController < ApplicationController
	# before_action :setup_cart_item!,only: [:create,:update,:destroy]


	def index
		@cart_items = CartItem.all
		@cart_item = (params[:id])
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
  		@cart_item = (params[:id])
    	@cart_item.update(quantity:params[:quantity].to_i)
    	#@cart_items.@cart_item.update(quantity:params[:quantity].to_i)
    	redirect_to cart_items_path
	end

	def destroy #一点消す
		@cart_item = CartItem.find(params[:id])
    	@cart_item.destroy
    	redirect_to cart_items_path
	end

	def destroy_all #カート内商品全消し
		@cart = current_cart
    	@cart.destroy
    	session[:item_id] = nil
    		respond_to do |format|
      		format.html { redirect_to cart_items_path, notice: 'カートが空になりました。' }
      		format.json { head :no_content }
      		end
	end



	private


	# def setup_cart_item!
 #   		@cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
 #  	end

  def cart_item_params
  	params.require(:cart_item).permit(:customer_id, :quantity, :item_id, :price)
  end


end

