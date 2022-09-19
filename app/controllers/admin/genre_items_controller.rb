class Admin::GenreItemsController < ApplicationController
    def create
        genre_item=GenreItem.new(genre_item_params)
        if genre_item.save
          redirect_to admin_genres_path
        else
          redirect_to admin_genres_path, alert: "ジャンル名を入力してください"
        end
    end
    
  def update
    genre_item=GenreItem.find(params[:id])
    if genre_item.update(genre_item_params)
      redirect_to admin_genres_path
    else
      redirect_to edit_admin_genre_path(genre_item), alert: "ジャンル名を入力してください"
    end
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
