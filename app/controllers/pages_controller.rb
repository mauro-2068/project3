class PagesController < ApplicationController
  def home
      @title = "Home"
      if signed_in?
	  @bookmark = Bookmark.new
	  @feed_items = current_user.feed.paginate(:page => params[:page])
      end
  end
  def new
    @user = User.new
  end
  def show
    
    @user  = User.find(params[:id])
     @title = @user.username
    @bookmarks = @user.bookmarks.paginate(:page => params[:page])
   
 
  end
  def search
    @title = "Search"
  end

  def help
	@title = "Help"
  end

end
