class Customers::ItemsController < ApplicationController

	#ログインユーザーのみproduct#indexは閲覧可
 #  before_action :authenticate!, except: [:index]
	# #退会済みユーザー
 #  before_action :customer_is_deleted, except: [:index]


  def index

    @genres = Genre.where(is_active: true)
    @array = []
    @genres.each do |genre|
      genre.items.each do |item|
        if item.is_active == true
            @array.push(item)
        end
      end
    end

  @items = Kaminari.paginate_array(@array).page(params[:page]).per(8)

  end


  def show
  	@items = Item.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new(item_id: @item.id)
     # ジャンルの有効無効ステータスが有効のものだけ探す/除外検索
    @genres = Genre.where(is_active: true)

    # #買い物はできないが、詳細ページの閲覧はできる。
    # if current_user.nil?
		  # items = CartItem.all
    # else
		  # items = current_user.cart_items
    # end

  end

   # ジャンル検索機能
  def search
    @item = Item.where(is_active: true)
    # パラメーターで渡ってきたジャンルidを元に、Item内のgenre_idと完全一致する商品情報を取得している。
    @items = Item.where(genre_id: params[:genre_id],is_active: true).page(params[:page]).per(8)
     # 検索してきたジャンルの商品数をカウント
    @quantity = Item.where(genre_id: params[:genre_id]).count
    @genres = Genre.where(is_active: true)
    @genre = Genre.find(params[:genre_id])
  end



end
