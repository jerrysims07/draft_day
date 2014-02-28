require 'spec_helper'

describe "League Pages" do
  subject { page }

  describe "profile page" do
    let(:user) {FactoryGirl.create(:user)}
    before do 
      visit user_path(user) 
      click_link "Create New League"
    end

    it { should have_title ('League') }
  end
end
