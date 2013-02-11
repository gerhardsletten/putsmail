class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :facebook_app_id, :emails_sent_count

  def emails_sent_count
    @emails_sent_count ||= TestMail.emails_sent_count
  end

  def current_user
    return unless session[:user_id]
    @user ||= User.find session[:user_id]
  end

  def facebook_app_id
    if Rails.env.production?
      "491894054166567"
    else
      "551580101535265"
    end
  end

  def authenticate_user!
    redirect_to root_path unless current_user
  end
end
