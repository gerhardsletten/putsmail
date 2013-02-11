# encoding: utf-8
class SubscriptionsController < ApplicationController
  before_filter :authenticate_user!

  def new
    redirect_to PaypalSubscription.new.checkout.url
  end

  def create
    render text: "ok"
  end

  def thank_you
    subscription = PaypalSubscription.new params["token"], params["PayerID"], current_user.id
    if subscription.request_payment.approved?
      subscription.create_recurring_profile
      current_user.update_subscription subscription
      render :thank_you
    else
      render text: "Unable to create your subscription. Try again later."
    end
  end

  def canceled
    render text: "canceled"
  end

  def ipn
    render text: "ipn"
  end
end

