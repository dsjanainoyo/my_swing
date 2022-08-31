class Admin::UsersController < ApplicationController
  def index
    @users=User.all
  end

  def show
    @user=User.find(params[:id])
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:relationship_id,:favorite_id,:genre_id,:user_image)
  end
end
