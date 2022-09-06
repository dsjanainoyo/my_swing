class Admin::GenresController < ApplicationController
  def index
    @genre_item=GenreItem.new
    @genre_items=GenreItem.all.page(params[:page]).per(8)
  end

  def edit
    @genre_item=GenreItem.find(params[:id])
  end

  
  private
  def genre_params
    params.permit(:name)
  end
end
