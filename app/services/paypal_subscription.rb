# encoding: utf-8

require "paypal/recurring"

class PaypalSubscriptionException < Exception; end

class PaypalSubscription
  attr_accessor :token, :payer_id, :reference

  attr_reader :profile_id, :started_at

  def initialize token=nil, payer_id=nil, reference=nil
    @token     = token
    @payer_id  = payer_id
    @reference = reference
  end

  def create_recurring_profile
    @started_at = Time.now
    ppr = PayPal::Recurring.new({
      token:        @token,
      reference:    @reference,
      payer_id:     @payer_id,
      frequency:    1,
      period:       :monthly,
      start_at:     @started_at,
      failed:       1,
      outstanding:  :next_billing,
      description:  CONFIG["paypal"]["description"],
      amount:       CONFIG["paypal"]["amount"],
      currency:     CONFIG["paypal"]["currenty"],
      ipn_url:      CONFIG["paypal"]["ipn_url"]
    })
    response = ppr.create_recurring_profile
    raise PaypalSubscriptionException unless response.valid?
    @profile_id = response.profile_id
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


