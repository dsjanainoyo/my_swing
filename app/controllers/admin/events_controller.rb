class Admin::EventsController < ApplicationController
  def index
    @events=Event.all
  end

  def show
  end

  def destroy
  end
end
