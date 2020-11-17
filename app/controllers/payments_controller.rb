class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]
  skip_before_action :authenticate_user!, only: [:webhook]
  skip_before_action :user_finished?, only: [:webhook]

  def success

  end

  def webhook
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    user_id = payment.metadata.user_id

    @user = User.find(user_id)
    @user.update(premium: true)

    render plain: "Success"
  end
end
