class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @cities = City.geocoded
    @markers = @cities.map do |city|
      {
        lat: city.latitude,
        lng: city.longitude,
        infowindow: render_to_string(partial: "info_window", locals: { spot: city })
      }
    end
  end

  def print
  end
end
