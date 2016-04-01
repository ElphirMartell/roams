class Users::SessionsController < ActiveAdmin::Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # POST /resource/sign_in
   def create
     if current_user.admin? == true
      redirect_to admin_dashboard_path
     else 
      redirect_to courses_path
     end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
