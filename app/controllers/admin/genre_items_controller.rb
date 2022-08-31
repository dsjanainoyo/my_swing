class Admin::GenreItemsController < ApplicationController
    def create
        genre_item=GenreItem.new(genre_item_params)
        genre_item.save
        redirect_to admin_genres_path
    end
    
  def update
    genre_item=GenreItem.find(params[:id])
    genre_item.update(genre_item_params)
    redirect_to admin_genres_path
  end

  def destroy
    genre_item=GenreItem.find(params[:id])
    genre_item.destroy
    redirect_to admin_genres_path
  end
    
    private
    def genre_item_params
        params.require(:genre_item).permit(:name)
    end
end
