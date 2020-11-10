class PagesController < ApplicationController
  def home
  end

  def finish_user
    @trait = Trait.new
  end
end
