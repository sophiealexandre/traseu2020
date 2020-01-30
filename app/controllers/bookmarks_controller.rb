class BookmarksController < ApplicationController

  # def index
  #   @itineraries = Itinerary.where(bookmark: true)
  #   if params[:query]
  #     @itinerary = Itinerary.find(params[:itinerary])
  #     # if params[:query] == "delete"
  #       @itinerary.bookmark = false
  #       @itinerary.save
  #       # @delete = true
  #     # end
  #     # raise
  #   end
  # end

  def index
    @bookmarks = Bookmark.where(user: current_user.id)
  end

  def create
    @itinerary = Itinerary.find(params[:id])
    @bookmark = Bookmark.new(user: current_user, itinerary: @itinerary)
    @bookmark.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @itinerary = Itinerary.find(params[:itinerary])
    @bookmarks = Bookmark.where(user: current_user.id)
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    respond_to do |format|
      format.js
    end
  end

  def update
    @itinerary = params[:itinerary_id]
    @bookmark = Bookmark.find_by(user: current_user, itinerary_id: @itinerary)
    if @bookmark
      @bookmark.destroy
      @bookmarked = false
    else
      @bookmark = Bookmark.create(user: current_user, itinerary_id: params[:itinerary_id])
      @bookmarked = true
    end
    @bookmarks = Bookmark.where(user: current_user.id)
  end
end
