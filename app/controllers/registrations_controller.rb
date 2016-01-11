class RegistrationsController < Devise::RegistrationsController
	protected

  # def configure_permitted_parameters
  #   user_attrs = [:name, :about, :avatar, :location, :gender, :birthday]
  #   # user_attrs.each do |user_attr|
  #   #   devise_parameter_sanitizer.for(:account_update) << user_attr
  #   # end

  #   devise_parameter_sanitizer.for(:account_update) do |u|
  #     u.permit(:name, :about, :avatar, :location, :gender, :birthday)
  #   end
  # end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :name, :about, :avatar, :location, :gender, :birthday)
  end

  def after_sign_up_path_for(resource)
    edit_user_registration_path
  end
end