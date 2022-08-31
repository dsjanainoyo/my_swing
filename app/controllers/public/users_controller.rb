class Public::UsersController < ApplicationController
  def show
  end

  def edit
    @user=User.find(current_user.id)
  end

  def update
    user=User.find(current_user.id)
    user.update(user_params)
    redirect_to public_user_path(current_user.id)
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:email,:user_image,genre_item_ids: [])
  end
end
