class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
           devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password) }
        end

end
