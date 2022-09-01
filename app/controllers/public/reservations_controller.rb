class Public::ReservationsController < ApplicationController
  def new
    @event=Event.find(params[:event_id])
    @reservation=Reservation.new
  end

  def create
    reservation=Reservation.new(reservation_params)
    reservation.user_id=current_user.id
    reservation.save
    redirect_to  public_reservations_index_path
  end

  def index
    @reservations=Reservation.all
    #@reservations.user_id=current_user.id
  end
  
  private
  def reservation_params
    params.require(:reservation).permit(:user_id,:event_id,:headcount,:reserve_status)
  end
end
