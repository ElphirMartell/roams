class Users::SessionsController < ActiveAdmin::Devise::SessionsController

  # POST /resource/sign_in

  def create
    if current_user.try(:admin?)
      redirect_to admin_dashboard_path
    elsif current_user == nil
      super
    else current_user.try(:admin?) == false
      redirect_to courses_path
    end
  end

  def non_existent_user
    if current_user == nil
      redirect_to new_user_session_path
    end
  end
  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #  devise_parameter_sanitizer.for(:sign_in) << :username
  # end
end
