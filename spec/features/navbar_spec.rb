require 'rails_helper'

describe 'When I look at the navigation bar' do
  describe "as a logged in user" do
    before :each do
      @user = User.create!(
                      username: 'USERNAME',
                      email: 'example@email.com',
                      password: 'Hunter2',
                      role: 0
                      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end
    it "has links to discover, top movies, top shows, user dashboard, logout" do
      visit '/dashboard'

      expect(page).to have_content("#{@user.username}'s Account")
      expect(page).to have_link('Dashboard')
      expect(page).to have_link('Discover')
      expect(page).to have_link('Top Movies')
      expect(page).to have_link('Top Shows')
      expect(page).to have_link('Logout')
    end

    it "has functional links", :vcr do
      visit '/dashboard'

      click_link 'Dashboard'
      expect(current_path).to eq('/dashboard')

      click_link 'Discover'
      expect(current_path).to eq('/discover')

      click_link 'Top Movies'
      expect(current_path).to eq('/movies')

      click_link 'Top Shows'
      expect(current_path).to eq('/shows')

      click_link 'Logout'
      expect(current_path).to eq('/')
    end
  end
end
