class SearchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def index
    @itineraries = Itinerary.where(user_id: current_user.id)
  end

  def new
    #raise
    @search = Search.new
  end

  def create
    raise
    @search = Search.new(search_params)
    if current_user.present?
      @search.user = current_user
    else
      @search.user = User.find_by(email: "sophie@email.com")
    end
    #raise
    if @search.save
      #raise
      redirect_to new_itinerary_path
    else
      #raise
      render :new
    end
  end

  private

  def search_params
    params.require(:search).permit(:country, :experience, :budget, :days)
  end

end
