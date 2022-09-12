class Musician::MusiciansController < ApplicationController
  def show
    @follower=current_musician.relationships
  end

  def edit
    @musician=current_musician
  end

  def update
    musician=current_musician
    musician.update(musician_params)
    redirect_to musician_musician_path(current_musician)
  end
  
  def withdrawal
    musician=Musician.find(params[:id])
    musician.update(is_deleted: true)
    redirect_to root_path
  end
  
  private
  def musician_params
    params.require(:musician).permit(:name,:introduction,:musician_image, genre_item_ids: [])
  end
end
