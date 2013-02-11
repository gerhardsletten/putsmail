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
      current_user.subscription_profile_id = subscription.create_recurring_profile.profile_id
      current_user.subscription_token      = subscription.token
      current_user.subscription_start_at   = Date.today
      current_user.save
      render :thank_you
    else
      render text: "It wasn't possible to create your subscription. Try again later."
    end
  end

  def canceled
    render text: "canceled"
  end

  def ipn
    render text: "ipn"
  end
end

require "paypal/recurring"
class PaypalSubscriptionException < Exception; end
class PaypalSubscription
  attr_accessor :token, :payer_id, :reference

  def initialize token=nil, payer_id=nil, reference=nil
    @token     = token
    @payer_id  = payer_id
    @reference = reference
  end

  def create_recurring_profile
    ppr = PayPal::Recurring.new({
      token:        @token,
      reference:    @reference,
      payer_id:     @payer_id,
      frequency:    1,
      period:       :monthly,
      start_at:     Time.now,
      failed:       1,
      outstanding:  :next_billing,
      description:  CONFIG["paypal"]["description"],
      amount:       CONFIG["paypal"]["amount"],
      currency:     CONFIG["paypal"]["currenty"],
      ipn_url:      CONFIG["paypal"]["ipn_url"]
    })
    response = ppr.create_recurring_profile
    raise PaypalSubscriptionException unless response.valid?
    OpenStruct.new profile_id: response.profile_id
  end

  def request_payment
    ppr = PayPal::Recurring.new({
      token:        @token,
      payer_id:     @payer_id,
      description:  CONFIG["paypal"]["description"],
      amount:       CONFIG["paypal"]["amount"],
      currency:     CONFIG["paypal"]["currenty"]
    })
    response = ppr.request_payment
    raise PaypalSubscriptionException unless response.valid?
    OpenStruct.new approved?: response.approved? && response.completed?
  end

  def checkout
    ppr = PayPal::Recurring.new({
      return_url:   CONFIG["paypal"]["return_url"],
      cancel_url:   CONFIG["paypal"]["cancel_url"],
      ipn_url:      CONFIG["paypal"]["ipn_url"],
      description:  CONFIG["paypal"]["description"],
      amount:       CONFIG["paypal"]["amount"],
      currency:     CONFIG["paypal"]["currenty"]
    })
    response = ppr.checkout
    raise PaypalSubscriptionException unless response.valid?
    OpenStruct.new url: response.checkout_url
  end
end


