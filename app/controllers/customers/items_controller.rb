class Customers::ItemsController < ApplicationController

	#ログインユーザーのみproduct#indexは閲覧可
  before_action :authenticate!, except: [:index]
	#退会済みユーザー
  before_action :customer_is_deleted, except: [:index]


  def index
  	@genres = Genre.all
    @items = Item.where(is_sale: true).page(params[:page]).per(8)
  end


  def show
  	@items = Item.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end



end
