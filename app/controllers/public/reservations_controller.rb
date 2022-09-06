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
  
  def destroy
    reservation=Reservation.find(params[:id])
    reservation.destroy
    redirect_to request.referer
  end

  def index
    @reservations=current_user.reservations.page(params[:page]).per(8)
  end
  
  private
  def reservation_params
    params.require(:reservation).permit(:user_id,:event_id,:headcount,:reserve_status)
  end
end
