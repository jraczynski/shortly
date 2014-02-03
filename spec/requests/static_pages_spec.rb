require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'short.ly'" do
      visit '/static_pages/home'
      expect(page).to have_content('short.ly')
    end

    it "should have the right title" do
      visit '/static_pages/home'
      expect(page).to have_title("short.ly | Home")
    end
  end
end
