require 'rails_helper'

RSpec.describe Party do

  describe 'Validations' do
    it {should validate_presence_of :movie_title}
    it {should validate_numericality_of :duration}
    it {should validate_presence_of :date}
    it {should validate_presence_of :start_time}
  end

  describe "relationships" do
    it {should belong_to :user}
  end

end
