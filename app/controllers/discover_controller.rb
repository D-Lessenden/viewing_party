class DiscoverController < ApplicationController
  def index
    unless current_user != nil
      render file: "/public/404"
    end
  end
end
