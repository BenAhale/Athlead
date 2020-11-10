class PagesController < ApplicationController
  def home
  end

  def finish_user
    if current_user.athlete?
      @trait = Trait.new
    elsif current_user.scout?
      @school = School.new
      @address = Address.new
      @school.build_address
    end
  end
end
