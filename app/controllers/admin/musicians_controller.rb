class Admin::MusiciansController < ApplicationController
  def index
    @musicians=Musician.all
  end

  def show
    @musician=Musician.find(params[:id])
  end
  
  private
  def musician_params
    params.require(:musician).permit(:name,:introduction,:is_deleted,:musician_imege)
  end
end
