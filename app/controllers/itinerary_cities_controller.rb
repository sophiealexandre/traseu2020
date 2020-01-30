class ItineraryCitiesController < ApplicationController

  def create
    @itinerary_city = ItineraryCity.new(city_id: params[:city], itinerary_id: params[:itinerary])
    @new_marker = {
      lat: @itinerary_city.city.latitude,
      lng: @itinerary_city.city.longitude,
      # WIP: add later
      infowindow: render_to_string(partial: "info_window", locals: { spot: @itinerary_city.city })
    }
    @itinerary_city.save
    # redirect_to itinerary_path(params[:id])
    # raise
    respond_to do |format|
      format.js
    end
  end

  def destroy
    itinerary_city = ItineraryCity.find(params[:id])
    itinerary_city.destroy
    # raise
    # redirect_to itinerary_path(itinerary_city.itinerary)
    # raise
    # respond_to do |format|
    #   format.js
    # end
  end

  def update
    @itinerary_city = ItineraryCity.find_by(city_id: params[:city_id], itinerary_id: params[:itinerary_id])
    if @itinerary_city
      @itinerary_city.destroy
    else
      @itinerary_city = ItineraryCity.create(city_id: params[:city_id], itinerary_id: params[:itinerary_id])
    end
  end
end
