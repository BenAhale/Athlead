class PagesController < ApplicationController
  skip_before_action :user_finished?, only: [:complete]

  def home
    @athletes = User.athlete
    if current_user.athlete?
      redirect_to athlete_path(current_athlete)
    elsif current_user.scout?
      render 'athletes'
    end
  end

  def athletes
    @athletes = User.athlete
  end

  def athlete
    @athlete = User.find(params[:id])
    @offer = Offer.new
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
