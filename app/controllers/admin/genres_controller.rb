class Admin::GenresController < ApplicationController
	before_action :authenticate_admin!


	def index
		@genre = Genre.new
		@genres = Genre.all

	end

	def create
		@genre = Genre.new(genre_params)
		if @genre.save
			redirect_to admin_genres_path, notice: "Genre has successfully created!"
		else
			@genres = Genre.all
			render :index
		end
	end

	def edit
		@genre = Genre.find(params[:id])

	end

	def update
		@genre = Genre.find(params[:id])
		@genres = Genre.all
			if @genre.update(genre_params)
				redirect_to admin_genres_path, notice: "Genre has successfully changed."
			else
				render :edit
			end
	end



	private
	def genre_params
		params.require(:genre).permit(:name, :is_active)
	end

end
