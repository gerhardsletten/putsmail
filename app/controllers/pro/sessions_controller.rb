class Pro::SessionsController < ApplicationController
  def create
    facebook = Facebook.new params.slice(:accessToken, :expiresIn)
    user     = User.from_facebook facebook

    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end

require "open-uri"
class Facebook
  attr_reader :access_token
  attr_reader :expires_in

  def initialize auth_response
    @auth_response = auth_response
    @access_token  = auth_response[:accessToken]
    @expires_in    = auth_response[:expires_in].to_i
  end

  def me
    @me ||= JSON.parse(open("https://graph.facebook.com/me?access_token=#{@access_token}").read)
  end
end
