require 'rails_helper'

# RSpec.describe 'Party Index Page' do
#
#   before(:each) do
#     @user1 = User.create!(username: 'Michael Scott', email: 'michaelscarn@email.com', password: 'holly', role: 0)
#     @user2 = User.create!(username: 'Dwight Kurt Schrute III', email: 'd-money@email.com', password: 'angela', role: 0)
#
#     @party1 = @user1.parties.create!(movie_title: "Schindler's List", duration: 197, date: '10/13/2020', start_time: '7:00 PM CT')
#     @party2 = @user1.parties.create!(movie_title: 'Spirited Away', duration: 125, date: '11/11/2020', start_time: '4:00 PM CT')
#     @party3 = @user2.parties.create!(movie_title: 'Forrest Gump', duration: 142, date: '10/18/2020', start_time: '6:00 PM CT')
#
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
#   end
#
#   it 'displays all of the parties the user has scheduled with pertinent information' do
#     visit '/parties'
#
#     expect(page).to have_link('Create New Party!', href: '/parties/new')
#
#     within ".parties-#{@party1.id}" do
#       expect(page).to have_content(@party1.movie_title)
#       expect(page).to have_content(@party1.duration)
#       expect(page).to have_content(@party1.date)
#       expect(page).to have_content(@party1.start_time)
#       expect(page).to_not have_content(@party2.movie_title)
#     end
#
#     within ".parties-#{@party2.id}" do
#       expect(page).to have_content(@party2.movie_title)
#       expect(page).to have_content(@party2.duration)
#       expect(page).to have_content(@party2.date)
#       expect(page).to have_content(@party2.start_time)
#       expect(page).to_not have_content(@party1.movie_title)
#     end
#
#     expect(page).to_not have_content(@party3.movie_title)
#
#   end
#
# #   As an authenticated user,
# # When I visit the new viewing party page,
# # I should see a form with the following:
# #
# #  Movie Title (that is un-editable)
# #  Duration of Party with a default value of movie runtime in minutes
# #  When: field to select date
# #  Start Time: field to select time
# #  Checkboxes next to each friend (if user has friends)
# #  Button to create a party
# # Details When the party is created, the authenticated user should be redirected back to the dashboard where the new event is shown. The event should also be seen by any friends that were invited when they log in.
#
# end
