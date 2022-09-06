class Public::RelationshipsController < ApplicationController
  def followings
    @musicians=current_user.followings.page(params[:page]).per(8)
  end
  
  def create
    current_user.follow(params[:musician_id])
    redirect_to request.referer
  end
  
  def destroy
    current_user.unfollow(params[:musician_id])
    redirect_to request.referer
  end
end
