require "spec_helper"

describe Api::CheckHtmlsController do
  describe "#create" do
    it "checks html" do
      CheckHtml.stub(:check_it).with("test").and_return({ body: "batman" })
      post "create", test_mail: { body: "test" }, format: :json

      expect(response.body).to eq  %Q{{"body":"batman"}}
    end
  end
end

