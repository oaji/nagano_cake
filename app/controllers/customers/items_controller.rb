class Customers::ItemsController < ApplicationController

	#ログインユーザーのみproduct#indexは閲覧可
 #  before_action :authenticate!, except: [:index]
	# #退会済みユーザー
 #  before_action :customer_is_deleted, except: [:index]


  def index
  	@genres = Genre.all
    @items = Item.where(is_active: true).page(params[:page]).per(8)
    # quantity => 総量/.count =>カウントメソッド、配列の要素の数を数えるための機能
    @quantity = Item.count
    # where=条件を絞り込むメソッド 複数取得する
     # ジャンルの有効無効ステータスが有効のものだけ探す/除外検索
    @genres = Genre.where(is_active: true)
  end


  def show
  	@items = Item.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new(item_id: @item.id)
     # ジャンルの有効無効ステータスが有効のものだけ探す/除外検索
    @genres = Genre.where(is_active: true)

    #買い物はできないが、詳細ページの閲覧はできる。
    if current_user.nil?
		  items = CartItem.all
    else
		  items = current_user.cart_items
    end

  end

   # ジャンル検索機能
  def search
    # パラメーターで渡ってきたジャンルidを元に、Item内のgenre_idと完全一致する商品情報を取得している。
    @items = Item.where(genre_id: params[:format]).page(params[:page]).per(8)
     # 検索してきたジャンルの商品数をカウント
    @quantity = Item.where(genre_id: params[:format]).count
    @genres = Genre.where(is_active: true)
     # renderを使用してviewファイルを表示したときにはactionを呼び出し処理をしているわけではないため、上記のように必要な変数を用意しておく必要がある、
    render 'index'
  end



end
