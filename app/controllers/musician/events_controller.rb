class Musician::EventsController < ApplicationController
  def index
    @events=current_musician.events.page(params[:page]).per(8)
  end

  def show
    @event=Event.find(params[:id])
    @comment=Comment.new
  end

  def new
    @event=Event.new
  end

  def create
    @event=Event.new(event_params)
    @event.musician_id=current_musician.id
    if @event.save
      redirect_to musician_event_path(@event)
    else
      render :new
    end
  end

  def edit
    @event=Event.find(params[:id])
  end

  def update
    @event=Event.find(params[:id])
    if @event.update(event_params)
      redirect_to musician_event_path(@event.id)
    else
      render :edit
    end
  end
  
  private
  def event_params
    params.require(:event).permit(:name,:musician_id,:introduction,:start_month,:start_day,:start_hour,:start_minutes,:place,:price,:capacity,:seating_status,:event_image,genre_item_ids: [])
  end
end
