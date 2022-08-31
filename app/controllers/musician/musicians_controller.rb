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
  
  private
  def musician_params
    params.require(:musician).permit(:name,:introduction,:musician_image, genre_item_ids: [])
  end
end
