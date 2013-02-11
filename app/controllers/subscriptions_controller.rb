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
class InvalidRecurringPayment < Exception; end
class PaypalSubscription
  attr_accessor :token, :payer_id, :reference

  def initialize token=nil, payer_id=nil, reference=nil
    PayPal::Recurring.configure do |config|
      config.sandbox   = true
      config.username  = "seller_1354580504_biz_api1.pablocantero.com"
      config.password  = "1354580523"
      config.signature = "AiPC9BjkCyDFQXbSkoZcgqH3hpacAHqtmvCOKJGgALmZG7.b5SzXsIQF"
    end
    @token       = token
    @payer_id    = payer_id
    @reference   = reference
    @description = "Puts Mail Pro Account Subscription"
    @amount      = "2.99"
    @currency    = "USD"
    @ipn_url     = "http://localhost:3000/pro/paypal/ipn"
  end

  def create_recurring_profile
    ppr = PayPal::Recurring.new({
      description:  @description,
      amount:       @amount,
      currency:     @currency,
      ipn_url:      @ipn_url,
      frequency:    1,
      token:        @token,
      period:       :monthly,
      reference:    @reference,
      payer_id:     @payer_id,
      start_at:     Time.now,
      failed:       1,
      outstanding:  :next_billing
    })
    response = ppr.create_recurring_profile
    raise InvalidRecurringPayment unless response.valid?
    OpenStruct.new profile_id: response.profile_id
  end

  def request_payment
    ppr = PayPal::Recurring.new({
      token:        @token,
      payer_id:     @payer_id,
      description:  @description,
      amount:       @amount,
      currency:     @currency
    })
    response = ppr.request_payment
    raise InvalidRecurringPayment unless response.valid?
    OpenStruct.new approved?: response.approved? && response.completed?
  end

  def checkout
    ppr = PayPal::Recurring.new({
      return_url:   "http://localhost:3000/pro/paypal/thank_you",
      cancel_url:   "http://localhost:3000/pro/paypal/canceled",
      ipn_url:      @ipn_url,
      description:  "Puts Mail Pro Account Subscription",
      amount:       "2.99",
      currency:     "USD"
    })
    response = ppr.checkout
    raise InvalidRecurringPayment unless response.valid?
    OpenStruct.new url: response.checkout_url
  end
end


