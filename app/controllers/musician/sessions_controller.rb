# frozen_string_literal: true

class Musician::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :musician_state, only: [:create]
  
  def after_sign_in_path_for(resource)
    musician_events_path(resource)
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

   protected
   
   def musician_state
     @musician=Musician.find_by(email: params[:musician][:email])
   return if !@musician
   
   if @musician.valid_password?(params[:musician][:password])
     if @musician.is_deleted == "withdrawal"
        redirect_to  new_musician_session_path
     end
   end
   
   end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
