class PagesController < ApplicationController
  def home
      @title = "Home"
      if signed_in?
	  @bookmark = Bookmark.new
	  @feed_items = current_user.feed.paginate(:page => params[:page])
      end
  end
  def search
    @title = "Search"
  end

  def help
	@title = "Help"
  end

end
