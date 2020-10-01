class Admin::ItemsController < ApplicationController

  # before_action :authenticate_admin!

  def index
    @items = Product.all # page(params[:page]).reverse_order
  end

  def new
    @item = Item.new
  end

  def create
    @item = item.new(item_params)
    if @item.save
      redirect_to admin_item_index_path(@item.id), notice:'商品を作成しました'
    else
      flash[:warning] = "入力内容を確認してください"
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = "更新に成功しました"
      render 'edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :description, :price, :sales_status)
  end

end
