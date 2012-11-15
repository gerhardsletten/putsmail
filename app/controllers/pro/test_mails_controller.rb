class Pro::TestMailsController < ApplicationController
  before_filter :authenticate_user!, only: [:index]
  def index
    @mails = current_user.test_mails
  end

  def show
    @mail = TestMail.find_by_token params[:id]
    render "show", layout: false
  end
end
