class DiscoverController < ApplicationController
  def index
    render file: '/public/404' if current_user.nil?
  end
end
