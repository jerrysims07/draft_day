require 'spec_helper'

describe "StaticPages" do
  
  describe "Home Page" do
    it "should have the content 'Draft Day'" do 
      visit '/static_pages/home'
      expect(page).to have_content('Draft Day')
    end
    it "should have the right name" do
      visit '/static_pages/home'
      expect(page).to have_title("Draft Day | Home")
    end 
  end

  describe "Help Page" do
    it "should have the word 'Help'" do 
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
    it "should have the right name" do
      visit '/static_pages/help'
      expect(page).to have_title("Draft Day | Help")
    end 
  end

  describe "About page" do
    it "should have the word 'About'" do
      visit '/static_pages/about'
      expect(page).to have_content('About')
    end
    it "should have the right name" do
      visit '/static_pages/about'
      expect(page).to have_title("Draft Day | About")
    end 
  end

  describe "Contact page" do 
    it "should have the content 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact')
    end
    it "should have the title 'Contact'" do 
      visit '/static_pages/contact'
      expect(page).to have_title("Draft Day | Contact")
    end 
  end 

end
