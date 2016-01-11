class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
  	flash[:alert] = "Access denied!"
  	redirect_to root_url
  end

  def configure_devise_permitted_parameters
    user_attrs = [:name, :about, :avatar, :location, :gender, :birthday]
    # user_attrs.each do |user_attr|
    #   devise_parameter_sanitizer.for(:account_update) << user_attr
    # end

    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :about, :avatar, :location, :gender, :birthday)
    end
  end
end
