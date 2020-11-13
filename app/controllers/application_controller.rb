class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :user_finished?
  skip_before_action :user_finished?, if: :devise_controller?


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:role, :name, :email, :password, :password_confirmation, :avatar)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:role, :name, :email, :password, :password_confirmation, :avatar)}
  end

  def user_finished?
    if current_user
      if (current_user.athlete? && current_user.statistic.nil?) || (current_user.scout? && current_user.school.nil?)
        redirect_to finish_user_path
      end
    end
  end
end
