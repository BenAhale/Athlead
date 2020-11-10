class TraitsController < ApplicationController
  skip_before_action :user_finished?

  def new
    @trait = Trait.new
  end

  def create
    @trait = Trait.new(user: current_user, height: trait_params[:height], weight: trait_params[:weight], position: trait_params[:position])

    if @trait.save
      redirect_to root_url
    else
      render json: @trait.errors
    end
  end


  private
  def trait_params
    params.require(:trait).permit(:height, :weight, :position)
  end
end