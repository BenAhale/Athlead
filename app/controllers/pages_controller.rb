class PagesController < ApplicationController
  skip_before_action :user_finished?, only: [:complete]

  def home
    @athletes = User.athlete
    if current_user.athlete?
      redirect_to athlete_path(current_user)
    elsif current_user.scout?
      render 'athletes'
    end
  end

  def conversations
    if current_user.scout?
      @conversations = current_user.started_conversations
    elsif current_user.athlete?
      @conversations = current_user.conversations
    end
  end

  def athletes
    @athletes = User.athlete
  end

  def athlete
    @athlete = User.find(params[:id])
    @offer = Offer.new
    @conversation = Conversation.new
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

  def offers
    if current_user.scout?
      @offers = current_user.sent_offers
    elsif current_user.athlete?
      @offers = current_user.received_offers
    end
  end

  def upgrade
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
        name: "Premium Upgrade",
        description: "Unlock full features and support the app by upgrading to premium!",
        amount: 3000,
        currency: 'aud',
        quantity: '1'
      }],
      payment_intent_data: {
        metadata: {
          user_id: current_user.id
        }
      },
      success_url: "#{root_url}payments/success",
      cancel_url: "#{root_url}upgrade"
    )
    @session_id = session.id
  end
end
