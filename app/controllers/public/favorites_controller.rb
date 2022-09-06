class Public::FavoritesController < ApplicationController
  def index
    @events=current_user.events.page(params[:page]).per(6)
  end
  
  def create
    event=Event.find(params[:event_id])
    favorite=current_user.favorites.new(event_id: event.id)
    favorite.save
    redirect_to public_event_path(event)
  end
  
  def destroy
    event=Event.find(params[:event_id])
    favorite=current_user.favorites.find_by(event_id: event.id)
    favorite.destroy
    redirect_to public_event_path(event)
  end
end
