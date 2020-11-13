class PagesController < ApplicationController
  skip_before_action :user_finished?, only: [:complete]

  def home
    if current_user.athlete?
      redirect_to athlete_path(current_user)
    elsif current_user.scout?
      render 'athletes'
    end
  end

  def athletes
    @athletes = User.all.map { |user| user if user.athlete? }
  end

  def athlete
    @athlete = User.find(params[:id])
  end

  def complete
    redirect_to root_url if current_user.statistic || current_user.school
    if current_user.athlete?
      @statistic = Statistic.new
    elsif current_user.scout?
      @school = School.new
      @address = @school.build_address
    end
  end
end
