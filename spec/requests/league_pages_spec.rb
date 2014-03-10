require 'spec_helper'
require 'support/spec_test_helper.rb'

describe "League Pages" do
  subject { page }

  describe "profile page" do
    let(:user) {FactoryGirl.create(:user)}
    before do 
      sign_in user
      visit user_path(user) 
      click_link "Create New League"
    end

    it { should have_title ('League') }
  end
end
