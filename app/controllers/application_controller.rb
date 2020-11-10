class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :user_finished?
  skip_before_action :user_finished?, if: :devise_controller?


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :role])
  end

  def user_finished?
    if current_user
      if (current_user.athlete? && current_user.trait.nil?) || (current_user.scout? && current_user.school.nil?)
        redirect_to finish_user_path
      end
    end
  end
end
