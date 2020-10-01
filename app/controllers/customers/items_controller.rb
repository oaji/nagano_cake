class Customers::ItemsController < ApplicationController

	#ログインユーザーのみproduct#indexは閲覧可
  before_action :authenticate!, except: [:index]
	#退会済みユーザー
  before_action :customer_is_deleted, except: [:index]


  def index
  	@genres = Genre.all
    @items = Item.where(is_sale: true).page(params[:page]).per(8)
    # where=条件を絞り込むメソッド 複数取得する
    @items = Items.active.where(genre_id: params["genre"])
    @genres = Genre.active
  end


  def show
  	@items = Item.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new(item_id: @item.id)

    #買い物はできないが、詳細ページの閲覧はできる。
    if current_user.nil?
		  items = CartItem.all
    else
		  items = current_user.cart_items
    end

  end



end
