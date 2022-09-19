class Public::UsersController < ApplicationController
  include Devise::Controllers::Helpers
  def show
  end

  def edit
    @user=User.find(current_user.id)
  end

  def update
    @user=User.find(current_user.id)
    if  @user.update(user_params)
       redirect_to public_user_path(@user.id)
    else
      render :edit
    end
   
   
  end
  
  def withdrawal
    user=User.find(params[:id])
    user.update(is_deleted: true)
    sign_out current_user
    redirect_to root_path
  end
  
  
  private
  def user_params
    params.require(:user).permit(:name,:email,:user_image,genre_item_ids: [])
  end
end
