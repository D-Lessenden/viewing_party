require 'rails_helper'

RSpec.describe "As a user" do
  describe "When I visit the registration page" do
    it "has a form that includes email, password, and password confirmation" do

    visit '/registation'

    end 
  end
end




#   When a user visits the '/registration' path they should see a form to register.
# The form should include:
#
#  Email
#  Password
#  Password Confirmation
#  Register Button
# Once the user registers they should be logged in and redirected to the dashboard page
