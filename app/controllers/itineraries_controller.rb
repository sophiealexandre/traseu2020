class ItinerariesController < ApplicationController

  def new
    if params[:query]
      @itinerary = Itinerary.find(params[:itinerary])
      @bookmarks = Itinerary.where(bookmark: true)
      case params[:query]
      when "create"
        # raise
        @itinerary.bookmark = true
        @itinerary.save!
      when "delete"
        # raise
        @itinerary.bookmark = false
        @itinerary.save!
      end
    end
    # http://localhost:3000/itineraries/new?
    # utf8=%E2%9C%93
    # &search%5Bexperience%5D=party
    # &search%5Bcountry%5D=peru
    # &search%5Bbudget%5D=1000
    # &search%5Bdays%5D=15&commit=Create+Search
    @search = Search.new(search_params)
    @search.user = current_user
    @search.save
    # raise
    # @search = Search.last
    @new_itinerary = Itinerary.new
    @itineraries = Itinerary.where(
      "country = ? OR experience = ?",
      params[:search][:country],
      params[:search][:experience]
    )
  end

  def create
    @itinerary = Itinerary.find(params[:itinerary][:id])
    if @itinerary.user == current_user
      redirect_to itinerary_path(@itinerary)
    else
      @new_itinerary = Itinerary.new(@itinerary.attributes)
      @new_itinerary.id = nil
      @new_itinerary.user = current_user
      @new_itinerary.bookmark = true
      if @new_itinerary.save
        @itinerary.itinerary_cities.each do |itinerary_city|
          new_itinerary_city = ItineraryCity.new(itinerary_city.attributes)
          new_itinerary_city.id = nil
          new_itinerary_city.itinerary = @new_itinerary
          new_itinerary_city.save
        end
        @itinerary.itinerary_spots.each do |itinerary_spot|
          new_itinerary_spot = ItinerarySpot.new(itinerary_spot.attributes)
          new_itinerary_spot.id = nil
          new_itinerary_spot.itinerary = @new_itinerary
          new_itinerary_spot.save
        end
        redirect_to itinerary_path(@new_itinerary)
      else
        raise
        render :new
      end
    end
  end

  def show
    @cities_map = City.geocoded

    # binding.pry
    @cities_all = City.all
    # @cities_names = @cities_all.map { |city| city.name }.sort
    @cities_names = @cities_all.sort_by do |city|
      -city.itinerary_cities.joins(:itinerary).where(itineraries: { user: current_user }).count
    end.map { |city| city.name }
    @cities = []
    @cities_names.each do |city_name|
      @cities_all.each do |city|
        if city.name == city_name
          @cities << city
        end
      end
    end
    @itinerary = Itinerary.find(params[:id])
    @markers = @itinerary.cities.map do |city|
      {
        lng: city.longitude,
        lat: city.latitude,
        # infowindow: render_to_string(partial: "info_window", locals: { spot: city })
      }
    end

    # if params[:call] == 'create'
    #   @itinerary_city = ItineraryCity.new(city_id: params[:city], itinerary_id: params[:id])
    #   @new_marker = {
    #     lat: @itinerary_city.city.latitude,
    #     lng: @itinerary_city.city.longitude,
    #     # WIP: add later
    #     infowindow: render_to_string(partial: "info_window", locals: { spot: @itinerary_city.city })
    #   }
    #   @itinerary_city.save
    #   # redirect_to itinerary_path(params[:id])
    #   # raise
    #   respond_to do |format|
    #     format.js
    #   end
    # end

    # if params[:call] == 'delete'
    #   itinerary_city = ItineraryCity.find(params[:itinerary_city])
    #   itinerary_city.destroy
    #   # redirect_to itinerary_path(params[:id])
    #   # raise
    #   respond_to do |format|
    #     format.js
    #   end
    # end

    # @bookmark = Bookmark.find_by("itinerary_id = ? AND user_id = ?", params[:id], current_user.id)
    # raise
    # @itineraries = Itinerary.where(bookmark: true)

    # if params[:query]
    #   case params[:query]
    #   when "create"
    #     @itinerary.bookmark = true
    #     @itinerary.save!
    #     # itinerary = Itinerary.find(params[:itinerary])
    #     # redirect_to itinerary_path(itinerary)
    #     # raise
    #     respond_to do |format|
    #       format.js
    #     end
    #   when "delete"
    #     # raise
    #     @itinerary.bookmark = false
    #     @itinerary.save!
    #     respond_to do |format|
    #       format.js
    #     end
    #   end
    # end
  end

  def destroy_itinerary_city
    @itinerary_city = ItineraryCity.find(params[:id])
    @itinerary = @itinerary_city.itinerary
    @city = @itinerary_city.city
    @itinerary_city.destroy
    # respond_to do |format|
    #   format.js
    # end
  end

  def create_itinerary_city
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
    @itinerary = Itinerary.find(params[:id])
    @itinerary.destroy
    # raise
    # redirect_to searches_path
  end

  private

  def search_params
    params.require(:search).permit(:country, :experience, :budget, :days, :query, :itinerary)
  end

  # def itinerary_city_params
  #   params.require(:itinerary_city).permit(:call, :city)
  # end
end
