require 'rails_helper'

RSpec.describe 'Create a New Party Page' do

  before(:each) do
    @user1 = User.create!(username: 'Michael Scott', email: 'michaelscarn@email.com', password: 'holly', role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
  end

  it 'displays a form to create a new viewing party', :vcr do

    visit "/movies/#{550}"
    click_link 'Create Viewing Party for Movie'

    expect(current_path).to eq("/movies/#{550}/parties/new")
    expect(page).to have_content('Viewing Party Details')
    save_and_open_page
    expect(page).to have_content('Movie title')
    expect(page).to have_content('Duration of party')
    expect(page).to have_content('Day')
    expect(page).to have_content('Start time')

    click_on 'Create party'
    expect(current_path).to eq('/dashboard')
  end

#   As an authenticated user,
# When I visit the new viewing party page,
# I should see a form with the following:
#
#  Movie Title (that is un-editable)
#  Duration of Party with a default value of movie runtime in minutes
#  When: field to select date
#  Start Time: field to select time
#  Checkboxes next to each friend (if user has friends)
#  Button to create a party
# Details When the party is created, the authenticated user should be redirected back to the dashboard where the new event is shown. The event should also be seen by any friends that were invited when they log in.

end
