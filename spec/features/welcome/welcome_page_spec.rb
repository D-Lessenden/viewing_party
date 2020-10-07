require 'rails_helper'

RSpec.describe "When a user visits the root path they should be on the welcome page" do

  it "displays a welcome message, a brief description, button to log in, and a link to registration." do
    visit '/'

    expect(page).to have_content("Welcome to Viewing Party!")
    expect(page).to have_link("Join Today!")
    expect(page).to have_button("Already a member? Log In Here!")
  end

end
