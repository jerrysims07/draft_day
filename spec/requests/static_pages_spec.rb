require 'spec_helper'

describe "StaticPages" do
  
  describe "Home Page" do
    before { visit root_path}
    it "should have the content 'Draft Day'" do 
      expect(page).to have_content('Draft Day')
    end
    it "should have the right name" do
      expect(page).to have_title("Draft Day | Home")
    end 
  end

  describe "Help Page" do
    before { visit help_path }
    it "should have the word 'Help'" do 
      expect(page).to have_content('Help')
    end
    it "should have the right name" do
      expect(page).to have_title("Draft Day | Help")
    end 
  end

  describe "About page" do
    before { visit about_path }
    it "should have the word 'About'" do
      expect(page).to have_content('About')
    end
    it "should have the right name" do
      expect(page).to have_title("Draft Day | About")
    end 
  end

  describe "Contact page" do 
    before { visit contact_path }
    it "should have the content 'Contact'" do
      expect(page).to have_content('Contact')
    end
    it "should have the title 'Contact'" do 
      expect(page).to have_title("Draft Day | Contact")
    end 
  end 

  describe "User Signup page" do
    before {visit signup_path }
    it "should have button call 'Sign Up'" do
      expect(page).to have_content

end
