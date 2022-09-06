class Musician::RelationshipsController < ApplicationController
  def followers
    @followers=current_musician.followers.page(params[:page]).per(8)

  end
end
