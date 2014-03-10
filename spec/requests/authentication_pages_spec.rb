require 'spec_helper'

describe "Authentication" do
  subject { page }
  describe "signin page"  do
    before { visit new_user_session_path }

    it {should have_content('Sign in')}
    it {should have_title('Sign in')}
  end

  describe "signin" do
    before { visit new_user_session_path }

    context "with invalid information" do
      before { click_button "Sign in" }
      
      # it { should have_title('Sign in')}
      # it { should have_selector('div.alert.alert-error') 
    end 
  end
end
