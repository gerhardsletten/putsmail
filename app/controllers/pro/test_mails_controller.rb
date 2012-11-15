class Pro::TestMailsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @mails = current_user.test_mails
  end
end
