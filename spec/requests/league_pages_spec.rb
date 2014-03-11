require 'spec_helper'
require 'support/spec_test_helper.rb'

describe "League Pages" do
  let(:user) {FactoryGirl.create(:user)}
  let(:league) { FactoryGirl.create(:league, user_id: user.id) }
  subject { page }

  context "new league page" do
=begin
    before(:each) do 
      sign_in user
      visit user_path(user) 
      click_link "Create New League"
    end
=end
    it "has the correct title" do
      LeaguesController.any_instance.stub(current_user: user, authenticate_user!: true)
      visit new_league_path
      expect(page).to have_title('League')
    end

    #it { should have_title ('League') }
  end

  context "show individual league" do
    before(:each) do
      LeaguesController.any_instance.stub(current_user: user, authenticate_user!: true)
      visit league_path(league.id)
    end

    it "displays the name of the league" do
      expect(page).to have_content(league.name)
    end

    it "should have 'draft' button" do
      expect(page).to have_link('Enter Draft')
    end

    it "should have 'Edit League' button" do
      expect(page).to have_link('Edit League')
    end

    it "should have 'Update Players' button" do
      expect(page).to have_link('Update Players')
    end

    it "should have 'Delete' button" do
      expect(page).to have_link('Delete')
    end
  end

  context "clicking 'Edit League' link" do
    before(:each) do
      LeaguesController.any_instance.stub(current_user: user, authenticate_user!: true)
      visit edit_league_path(league.id)
    end

    it "has the right title" do
      expect(page).to have_title('Edit League')
    end
  end

  context "clicking 'Update'" do
    before(:each) do
      LeaguesController.any_instance.stub(current_user: user, authenticate_user!: true)
      visit edit_league_path(league.id)
      select(8, :from => 'League_passTDs')
      click_button('Update')
    end

    it "takes us back to league profile page" do 
      expect(page).to have_title(league.name)
    end
  end

  context "clicking 'Delete'" do
    before(:each) do
      LeaguesController.any_instance.stub(current_user: user, authenticate_user!: true)
      visit league_path(league.id)
      click_link('Delete')
    end

    it "gets rid of league name" do
      expect(page).to have_no_content(league.name)
    end

  end
end
