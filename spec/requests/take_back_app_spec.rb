require 'spec_helper'

describe "TakeBackApp" do

  describe "Home page" do

    it "should have the content 'TakeBackApp'" do
      visit '/take_back_app/home'
      expect(page).to have_content('TakeBackApp')
    end

    it "should have the title 'Home'" do
      visit '/take_back_app/home'
      expect(page).to have_selector('title', :text => "TakeBackApp")
    end

  end
end