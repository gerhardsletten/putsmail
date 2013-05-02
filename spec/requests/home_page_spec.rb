require "spec_helper"

describe "home page" do
  before :each do
    visit "/"
  end

  it "displays Puts Mail" do
    page.should have_content "Puts Mail"
  end
end

