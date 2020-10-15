require 'rails_helper'

RSpec.describe "Viewing party index page" do
    before :each do
     @user1 = User.create!(username: 'Michael Scott', email: 'michaelscarn@email.com', password: 'holly', role: 0)
     @user2 = User.create!(username: 'Dwight Kurt Schrute III', email: 'd-money@email.com', password: 'angela', role: 0)

     @party1 = @user1.parties.create!(movie_title: 'Spirited Away', duration: 125, date: '11/11/2020', start_time: '4:00 PM CT')
     @friend = User.create!(
                  username: 'FRIEND',
                  email: 'friend@email.com',
                  password: 'Hunter2',
                  role: 0
                  )

     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
    end

    it "has a list of the parties for user" do
      visit '/parties'
      expect(page).to have_content('Spirited Away')
      expect(page).to have_content('2020-11-11')
      expect(page).to have_content('2000-01-01 16:00:00 UTC')
  end
end
