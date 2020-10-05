class Customers::CartItemsController < ApplicationController
	before_action :setup_cart_item!,only: [:create,:update,:destroy]

	def index
		@cart_items = CartItem.all
	end

	def create#ここ以外
    end

    def update#カート内商品データ更新
    	@cart_items.update(quantity: params[:quantity].to_i)
    	redirect_to current_cart
	end

	def destroy #一点消す
		@cart_item = CartItem.find(params[:id])
    	@cart_item.destroy
    	redirect_to cart_items_path
	end

	def destroy_all #カートない商品全消し
		@cart = current_cart
    	@cart.destroy
    	session[:item_id] = nil
    		respond_to do |format|
      		format.html { redirect_to cart_items_path, notice: 'カートが空になりました。' }
      		format.json { head :no_content }
      		end
	end



	private


	def setup_cart_item!
   		@cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  	end

end