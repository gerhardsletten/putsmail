class GalleriesController < ApplicationController
  def index
    @emails = TestMail.public_mails
  end

  def show
    @email = TestMail.public_mails.find params[:id]
    render "show", layout: false
  end
end

