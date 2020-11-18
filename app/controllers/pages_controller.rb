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
    remove_athletes
    if params[:search].present?
      @athletes = User.athlete.where(nil)
      @athletes = (User.athlete).search_by_name(params[:search][:name]) if params[:search][:name].present?
      @athletes = @athletes.filter_by_position(params[:search][:position]) if params[:search][:position].present?
      @athletes = @athletes.filter_min_height(params[:search][:height][:min]) if params[:search][:height][:min].present?
      @athletes = @athletes.filter_max_height(params[:search][:height][:max]) if params[:search][:height][:max].present?
      @athletes = @athletes.filter_min_weight(params[:search][:weight][:min]) if params[:search][:weight][:min].present?
      @athletes = @athletes.filter_max_weight(params[:search][:weight][:max]) if params[:search][:weight][:max].present?
      @athletes = @athletes.filter_min_points(params[:search][:points][:min]) if params[:search][:points][:min].present?
      @athletes = @athletes.filter_max_points(params[:search][:points][:max]) if params[:search][:points][:max].present?
      @athletes = @athletes.filter_min_rebounds(params[:search][:rebounds][:min]) if params[:search][:rebounds][:min].present?
      @athletes = @athletes.filter_max_rebounds(params[:search][:rebounds][:max]) if params[:search][:rebounds][:max].present?
      @athletes = @athletes.filter_min_assists(params[:search][:assists][:min]) if params[:search][:assists][:min].present?
      @athletes = @athletes.filter_max_assists(params[:search][:assists][:max]) if params[:search][:assists][:max].present?
    else
      @athletes = User.athlete
    end
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

  private
  def remove_athletes
    redirect_to root_url if current_user.athlete?
  end
end
