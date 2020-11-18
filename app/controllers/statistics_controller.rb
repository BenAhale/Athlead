class StatisticsController < ApplicationController
  before_action :set_statistic, only: [:edit, :update]
  skip_before_action :user_finished?

  def edit
    user_authorised?(@statistic)
  end

  def create
    @statistic = current_user.build_statistic(statistic_params)

    if @statistic.save
      redirect_to athlete_path(current_user.id), notice: 'Success!'
    else
      redirect_to finish_user_path, notice: 'Something went wrong! Please try again.'
    end
  end

  def update
    user_authorised?(@statistic)
    if @statistic.update(statistic_params)
      redirect_to athletes_path(current_user), notice: 'Statistics updated!'
    else
      redirect_to athletes_path(current_user), notice: 'Something went wrong. Statistics were not updated.'
    end
  end

  private
    def set_statistic
      @statistic = Statistic.find(current_user.statistic.id)
    end

    def statistic_params
      params.require(:statistic).permit(:position, :height, :weight, :points, :rebounds, :assists, :steals, :blocks)
    end
end
