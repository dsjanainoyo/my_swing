class Public::MusiciansController < ApplicationController
  def index
    if params[:musician_key].present?
      @musicians=Musician.where('name LIKE ? OR introduction LIKE ?', "%#{params[:musician_key]}%", "%#{params[:musician_key]}%").page(params[:page]).per(8)
    else
      @musicians=Musician.page(params[:page]).per(8)
    end
  end

  def show
    @musician=Musician.find(params[:id])
    @musician_events=@musician.events.page(params[:page]).per(6)
  end
  
  private
  
  def musician_params
    params.require(:musician).permit(:name,:introduction,:genre_item_id,:follower_id,:musician_image,:event_id)
  end
end
