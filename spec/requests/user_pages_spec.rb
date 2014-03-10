require 'spec_helper'
require 'support/spec_test_helper.rb'

describe "UserPages" do
  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }


    before do 
      sign_in user
    end

    it { should have_no_content('You need to sign in or sign up before continuing') }
    it { should have_content(user.name)}
    it { should have_title(user.name)}  
    it { should have_selector('a', text: 'Create New League')}

    context "with no leagues"
      it { should have_content('You have not created a league yet.')}

    context "with leagues" do
      
      before do
        visit new_league_path
        fill_in 'League_name', with: 'My Test League Name'
        click_button 'Create League'
      end

      it {should have_content('My Leagues:')}
      it {should have_content('My Test League Name')}
    end
  end

  # describe "signup page" do
  #   before do
  #     visit new_user_registration_path
  #   end

  #   context "valid data should correctly populate model"

  #     before do
  #       fill_in 'user_name', with: 'Jerry'
  #       fill_in 'user_email', with: 'jerry@jerry.com'
  #       fill_in 'user_password', with: 'jerryjerry'
  #       fill_in 'user_password_confirmation', with: 'jerryjerry'
  #       click_button 'Sign up'
  #     end

  #     it { should current_user.name == user.name }
  #   end
end
