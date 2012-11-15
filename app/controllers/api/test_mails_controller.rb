# encoding: utf-8

class Api::TestMailsController < ApplicationController
  respond_to :json
  before_filter :adds_user_references, only: [:create, :update]

  def create
    test_mail = TestMail.create params[:test_mail]
    save_test_mail_cookie test_mail.token
    respond_with test_mail, location: api_test_mail_url(test_mail)
  end

  def update
    test_mail = TestMail.find_by_token! cookies[:last_test_mail_id]
    params[:test_mail][:dispatch]        = params[:dispatch] if params[:dispatch] # ???
    # params[:test_mail][:make_css_inline] = params[:make_css_inline] if params[:make_css_inline] # ???
    test_mail.update_attributes params[:test_mail]
    respond_with test_mail
  end

  def show
    test_mail = TestMail.find_by_token! params[:id]
    save_test_mail_cookie test_mail.token
    respond_with test_mail
  end

  private

  def save_test_mail_cookie token
    cookies[:last_test_mail_id] = {value: token, expires: 3.months.from_now}
  end

  def adds_user_references
    if params[:test_mail] && current_user
      params[:test_mail][:user_id] = current_user.id
    end
  end
end
