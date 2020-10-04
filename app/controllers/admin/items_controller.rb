class Admin::ItemsController < ApplicationController

  # before_action :authenticate_admin!

  def index
    @items = Item.all.page(params[:page]).reverse_order
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path(@item), success:"商品登録に成功しました"
    else
      flash.now[:danger]="商品登録に失敗しました"
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
      redirect_to admin_items_path(@item)
    else
      flash.now[:danger]="更新に失敗しました"
      render "edit"
    end
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :sales_status, :description, :is_active)
  end

  def set_genres
    @genres = Genre.where(is_valid: true)
  end

end