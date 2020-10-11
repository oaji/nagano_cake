class Customers::ItemsController < ApplicationController

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
    @genres = Genre.where(is_active: true)

    if current_customer.nil?
		  @items = Item.all
    else
		  @items = current_customer.cart_items
    end

  end

  def search
    @item = Item.where(is_active: true)
    @items = Item.where(genre_id: params[:genre_id],is_active: true).page(params[:page]).per(8)
    @quantity = Item.where(genre_id: params[:genre_id]).count
    @genres = Genre.where(is_active: true)
    @genre = Genre.find(params[:genre_id])
  end



end
