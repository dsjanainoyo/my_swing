class Public::FavoritesController < ApplicationController
  def index
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
