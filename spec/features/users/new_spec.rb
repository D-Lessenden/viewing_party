require 'rails_helper'

RSpec.describe "As a user" do
  describe "When I visit the registration page" do
    it "has a form that includes email, password, and password confirmation" do
      visit '/registration'
      fill_in "Email" , with: "email@email.com"
      fill_in "Password", with: 'Hunter2'
      fill_in "Password Confirmation", with: 'Hunter2'
      click_button "Register"
      expect(current_path).to eq('/dashboard')
      expect(page).to have_content("Welcome email@email.com, you are now registered and logged in!")
    end

    it "has a flash message if password and password confirmation do not match" do
      visit '/registration'
      fill_in "Email" , with: "email@email.com"
      fill_in "Password", with: 'Hunter2'
      click_button "Register"
      expect(current_path).to eq('/registration')
      expect(page).to have_content("Password confirmation doesn't match Password")
    end

    it "has a flash message if email is left blank" do
      visit '/registration'
      fill_in "Password", with: 'Hunter2'
      fill_in "Password Confirmation", with: 'Hunter2'
      click_button "Register"
      expect(current_path).to eq('/registration')
      expect(page).to have_content("Email can't be blank")
    end
  end
end
