class ApplicationController < ActionController::Base
 before_action :update_allowed_parameters, if: :devise_controller?
 protected

 def update_allowed_parameters
   devise_parameter_sanitizer.permit(:sign_up) do |u|
     u.permit(:name, :email, :password, :password_confirmation)
   end
 end

 def after_sign_out_path_for(_resource_or_scope)
   new_user_session_path
 end
end
