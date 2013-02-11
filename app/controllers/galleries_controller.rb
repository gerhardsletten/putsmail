class GalleriesController < ApplicationController
  def index
    @mails = TestMail.public_mails.all
  end

  def show
    @mail = TestMail.public_mails.find params[:id]
    render "show", layout: false
  end
end

