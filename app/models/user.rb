# encoding: utf-8
require "email_format_validator"

class User < ActiveRecord::Base  
  validates :mail      , uniqueness: true   , allow_nil: false ,
    email_format: true , allow_blank: false

  has_many :test_mail_users, :dependent => :destroy
  has_many :test_mails

  before_create :create_user_token

  def subscribe!
    update_attributes subscribed: true
  end

  def unsubscribe!
    update_attributes subscribed: false
  end

  def self.from_facebook facebook
    user = find_or_initialize_from_facebook facebook
    user.provider         = "facebook"
    user.uid              = facebook.me["id"]
    user.name             = facebook.me["name"]
    user.mail             = facebook.me["email"]
    user.oauth_token      = facebook.access_token
    user.oauth_expires_at = Time.at facebook.expires_in
    user.save!
    user
  end

  def update_subscription subscription
    @subscription_profile_id = subscription.profile_id
    @subscription_token      = subscription.token
    @subscription_started_at = subscription.started_at
    save
  end


  private

  def self.find_or_initialize_from_facebook facebook
    where("(uid = ? AND provider = ?) OR mail = ?",
          facebook.me["id"],
          "facebook",
          facebook.me["email"]).first || new
  end

  private
  def create_user_token
    write_attribute :token, generate_token(mail)
  end

  def generate_token(param)
    # http://www.ruby-doc.org/core/classes/Time.html#M000392
    # http://stackoverflow.com/a/6591427/464685
    Digest::MD5.hexdigest("#{param}#{rand.to_s}#{Time.now.strftime("%9N").to_s}").encode("UTF-8")
  end
end
