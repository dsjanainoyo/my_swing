class Admin::EventsController < ApplicationController
  def index
    @events=Event.all.page(params[:page]).per(8)
    
    
  end

  def show
    @event=Event.find(params[:id])
    
    @total_headcount=0
    @event.reservations.each do |reservation|
      @total_headcount=@total_headcount+reservation.headcount
    end
    
  end

  def destroy
    event=Event.find(params[:id])
    event.destroy
    redirect_to admin_events_path
  end
end
