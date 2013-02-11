class SiteController < ApplicationController
  def index
    @last_test_mail_id = cookies[:last_test_mail_id]
  end

  def old_gallery
    redirect_to galleries_path, status: 301
  end

  def old_index
    redirect_to "/tests/#{params[:token]}", status: 301
  end

  def old_gallery_item
    redirect_to "/galleries/#{params[:id]}", status: 301
  end
end

