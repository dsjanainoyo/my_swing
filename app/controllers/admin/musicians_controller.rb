class Admin::MusiciansController < ApplicationController
  def index
    @musicians=Musician.page(params[:page]).per(8)
  end

  def show
    @musician=Musician.find(params[:id])
  end
  
  def withdrawal
    musician=Musician.find(params[:id])
    musician.update(is_deleted: true)
    redirect_to admin_musician_path(musician)
  end
  
  private
  def musician_params
    params.require(:musician).permit(:name,:introduction,:is_deleted,:musician_imege)
  end
end
