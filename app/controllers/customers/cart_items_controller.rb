class Customers::CartItemsController < ApplicationController

  before_action:authenticate_customer!,except:[:index]

	def index
		@cart_items = CartItem.all
	end

	def create
    @cart_item = current_customer.cart_items.build(cart_item_params)
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      if cart_item.item_id == @cart_item.item_id
         new_quantity = cart_item.quantity + @cart_item.quantity
         cart_item.update_attribute(:quantity, new_quantity)
         @cart_item.delete
      end
    end
    @cart_item.save
    flash[:notice] = "#{@cart_item.item.name}をカートに追加しました"
    redirect_to cart_items_path
	end

  def update
  		@cart_items = CartItem.all
  		@cart_item = CartItem.find(params[:id])
    	@cart_item.update(quantity:params[:cart_item][:quantity].to_i)
	end


	def destroy
		@cart_items = CartItem.all
		@cart_item = CartItem.find(params[:id])
    @cart_item.destroy
	end

	def destroy_all
		@cart_items = CartItem.all
		@cart_items.destroy_all
	end



	private

  def cart_item_params
  	params.require(:cart_item).permit(:customer_id, :quantity, :item_id, :price)
  end

end
