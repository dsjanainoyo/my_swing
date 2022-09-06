class Admin::UsersController < ApplicationController
  def index
    @users=User.page(params[:page]).per(8)
  end

  def show
    @user=User.find(params[:id])
  end
  
  def withdrawal
    user=User.find(params[:id])
    user.update(is_deleted: true)
    redirect_to admin_user_path(user)
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:favorite_id,:genre_id,:user_image,:is_deleted)
  end
end
