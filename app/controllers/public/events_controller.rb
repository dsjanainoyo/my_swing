class Public::EventsController < ApplicationController
  def index
    if params[:event_key].present?
      @events=Event.where('name LIKE ? OR introduction LIKE ?', "%#{params[:event_key]}%", "%#{params[:event_key]}%").page(params[:page]).per(6)
    else
      @events=Event.page(params[:page]).per(6)
    end
    
  end

  def show
    @event=Event.find(params[:id])
    @comment=Comment.new
  end
  
  private
  def event_params
    params.require(:event).permit(:name,:musician_id,:datetime,:place,:genre_item_id,:seating_status,:event_image)
  end
end
