class Customers::TopController < ApplicationController


	def top

    @genres = Genre.where(is_active: true)
    @array = []
    @genres.each do |genre|
      genre.items.each do |item|
        if item.is_active == true
            @array.push(item)
        end
      end
    end

  @items = Kaminari.paginate_array(@array).page(params[:page]).per(4)

	end

	def about
	end

	def index
	end

private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :sales_status, :description, :is_active)
  end

  def set_genres
    @genres = Genre.where(is_valid: true)
  end

end