class OffersController < ApplicationController

  def create
    @offer = Offer.new(scout: current_user, athlete_id: offer_params[:athlete_id])
    if @offer.save
      redirect_to athlete_path(@offer.athlete)
    else
      redirect_to athlete_path(@offer.athlete)
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    athlete = @offer.athlete
    @offer.destroy
    redirect_to athlete_path(athlete)
  end

  private
  def offer_params
    params.require(:offer).permit(:athlete_id)
  end
end