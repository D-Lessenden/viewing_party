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

  it "won't log in with incorrect credentials" do
    visit root_path

    fill_in "Username", with: @user.username
    fill_in "Password", with: "cooldude"

    expect(current_path).to eq("/")
    # expect(page).to have_content("Incorrect email or password")
    expect(page).to have_button("Log In")

    fill_in "Username", with: "Cool Dude"
    fill_in "Password", with: @user.password

    expect(current_path).to eq("/")
    # expect(page).to have_content("Incorrect email or password")
    expect(page).to have_button("Log In")
  end

  it "allows a user to log out" do
    visit root_path

    fill_in "Username", with: @user.username
    fill_in "Password", with: @user.password
    click_button "Log In"

    click_link "Logout"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("You have logged out. See you next time!")
    expect(page).to_not have_link("Logout")
  end

end
