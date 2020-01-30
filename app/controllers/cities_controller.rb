class CitiesController < ApplicationController
  def show
    # @navbar_transparent = true
    @restaurants = Spot.where(city_id: params[:id], category_id: Category.find_by(title: "restaurant").id)
    @hotels = Spot.where(city_id: params[:id], category_id: Category.find_by(title: "hotel").id)
    @activities = Spot.where(city_id: params[:id], category_id: Category.find_by(title: "activity").id)
    @city = City.find(params[:id])
    # raise
  end
end
