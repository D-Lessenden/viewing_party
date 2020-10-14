require 'rails_helper'

RSpec.describe 'As an authenticated user, when I visit my dashboard', type: :feature do

  before :each do
    @user1 = User.create!(username: 'Michael Scott', email: 'michaelscarn@email.com', password: 'holly', role: 0)
    @user2 = User.create!(username: 'Dwight Kurt Schrute III', email: 'd-money@email.com', password: 'angela', role: 0)

    @party1 = @user1.parties.create!(movie_title: "Schindler's List", duration: 197, date: '10/13/2020', start_time: '7:00 PM CT')
    @party2 = @user2.parties.create!(movie_title: 'Spirited Away', duration: 125, date: '11/11/2020', start_time: '4:00 PM CT')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
  end

    it "has a welcome message, a button to discover movies, friend section, and a viewing party section" do
      visit '/dashboard'
      expect(page).to have_content("Welcome #{@user1.username}!")
      expect(page).to have_button("Add Friend")
      expect(page).to have_button("Discover Movies")
      expect(page).to have_content("You currently have no friends.")
    end

    it "has a functional button for the Discover Movies button" do
      visit '/dashboard'
      click_button "Discover Movies"
      expect(current_path).to eq('/discover')
      expect(page).to have_content("Discover Your Next Favorite Movie!")
    end

  it 'displays all of the parties the user has scheduled with pertinent information' do
    visit '/dashboard'

    expect(page).to have_link('Create New Party!', href: '/parties/new')

    expect(page).to have_content("Movie Title: #{@party1.movie_title}")
    expect(page).to have_content("Duration: #{@party1.duration} minutes")
    expect(page).to have_content("Date: #{@party1.date}")
    expect(page).to have_content("Start Time: #{@party1.start_time}")

    expect(page).to_not have_content(@party2.movie_title)
  end

end
