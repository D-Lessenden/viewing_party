require "rails_helper"

RSpec.describe "As a registered user, I can log in and log out" do

  before :each do
    @user = User.create(username: "Michael Scott", email: "michaelscarn@email.com", password: "holly", role: 0)
  end

  it "allows me to log in with the correct credentials" do

    visit root_path

    fill_in "Username", with: @user.username
    fill_in "Password", with: @user.password
    click_button "Log In"

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("#{@user.username}'s Account")
  end


end
