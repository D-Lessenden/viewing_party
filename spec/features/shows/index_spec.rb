require 'rails_helper'

RSpec.describe "Show Page as a user" do
  it "if a non-authenticated user visits the page they recieve an error", :vcr do
    visit "/shows"
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

  describe "as an authenticated user" do
    it "displays 40 shows with their title and vote average", :vcr do
      @user = User.create!(
                      username: 'USERNAME',
                      email: 'example@email.com',
                      password: 'Hunter2',
                      role: 0
                      )

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)


      visit "/shows"
      expect(page).to have_content("Top 40 Shows")
    end
  end
end
