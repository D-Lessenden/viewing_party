require 'rails_helper'

RSpec.describe "As an authenticated user" do
  before :each do
    @user = User.create!(
                    username: 'USERNAME',
                    email: 'example@email.com',
                    password: 'Hunter2',
                    role: 0
                    )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  describe "When I visit the '/discover' path" do
    it "should have a button to discover top 40 movies" do
      visit '/discover'
      expect(page).to have_button("Discover Top 40")
    end
  end
end
