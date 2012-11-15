class Pro::TestMailsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @mails = current_user.test_mails
  end

  def show
    @mail = current_user.test_mails.find_by_token params[:id]
    render "show", layout: false
  end
end
