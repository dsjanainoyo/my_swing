class Public::EventsController < ApplicationController
  def index
    @events=Event.all
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
