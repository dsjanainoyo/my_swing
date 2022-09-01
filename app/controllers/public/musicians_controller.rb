class Public::MusiciansController < ApplicationController
  def index
    @musicians=Musician.all
  end

  def show
    @musician=Musician.find(params[:id])
  end
  
  private
  
  def musician_params
    params.require(:musician).permit(:name,:introduction,:genre_item_id,:relationship_id,:musician_image,:event_id)
  end
end
