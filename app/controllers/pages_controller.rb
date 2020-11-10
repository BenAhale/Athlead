class PagesController < ApplicationController
  skip_before_action :user_finished?, only: [:finish_user]

  def home
  end

  def user_profile
    @athlete = User.find(params[:id])
  end

  def finish_user
    if current_user.athlete?
      @trait = Trait.new
    elsif current_user.scout?
      @school = School.new
      @address = @school.build_address
    end
  end
end
