class OffersController < ApplicationController
  before_action :set_offer, only: [:update, :destroy]

  def create
    @offer = Offer.new(scout: current_user, athlete_id: offer_params[:athlete_id])
    if @offer.save
      redirect_to athlete_path(@offer.athlete)
    else
      redirect_to athlete_path(@offer.athlete)
    end
  end

  def update
    if @offer.update(status: offer_params[:status])
      if @offer.accepted?
        @offer.athlete.received_offers.each do |offer|
          unless offer.id == @offer.id
            offer.update(status: "declined")
          end
        end
      end
      redirect_to offers_path
    else
      render plain: "Error"
    end
  end

  def destroy
    athlete = @offer.athlete
    @offer.destroy
    redirect_to athlete_path(athlete)
  end

  private
  def offer_params
    params.require(:offer).permit(:athlete_id, :status)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end
end