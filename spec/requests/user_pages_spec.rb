
require 'spec_helper'

describe "UserPages" do
  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',   text: 'Sign up') }
  end    

  describe "clicking signup button" do
    before { visit signup_path } 
    let(:submit) {"Create Account"}

    describe "with no data" do
      it "should not work" do
       expect { click_button "Create Account" }.not_to change(User, :count)
      end
    end

    describe "with valid data" do
      before do
        fill_in "user_name", with: "Johnny"
        fill_in "user_email", with: "user@example.com"
        fill_in "user_password", with: "password"
      end

      it "should create a new user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end


  # describe "Home Page" do
  #   before { visit root_path}
  #   it "should have the content 'Draft Day'" do 
  #     expect(page).to have_content('Draft Day')
  #   end
  #   it "should have the right name" do
  #     expect(page).to have_title("Draft Day | Home")
  #   end 
  # end