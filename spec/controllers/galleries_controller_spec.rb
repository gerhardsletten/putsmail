require "spec_helper"

describe GalleriesController do
  let(:test_mail)    { double "Test Mail" }
  let(:public_mails) { double "Public Mails" }
  let(:id)           { "0" }

  before do
    TestMail.stub public_mails: public_mails
    public_mails.stub(:find).with(id).and_return test_mail
  end

  describe "#index" do
    it "loads all test_mails" do
      get "index"
      expect(assigns(:emails)).to eq public_mails
    end
  end

  describe "#show" do
    it "loads test_mail" do
      get "show", id: id
      expect(assigns(:email)).to eq test_mail
      expect(response).to render_template(:show, layout: false)
    end
  end
end

