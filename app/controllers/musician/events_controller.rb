class Musician::EventsController < ApplicationController
  def index
    @events=current_musician.events
  end

  def show
    @event=Event.find(params[:id])
  end

  def new
    @event=Event.new
  end

  def create
    event=Event.new(event_params)
    event.save
    redirect_to musician_events_path
  end

  def edit
    @event=Event.find(params[:id])
  end

  def update
  end
  
  private
  def event_params
    params.require(:event).permit(:name,:musician_id,:introduction,:datetime,:place,:price,:capacity,:seating_status,:event_image,genre_item_ids: [])
  end
end
