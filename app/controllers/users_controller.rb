class UsersController < ApplicationController
    before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
    before_filter :correct_user, :only => [:edit, :update]
    before_filter :admin_user,   :only => :destroy

  def index
    @title = "All users"
    @users  =  User.paginate(:page => params[:page])
  end
  ###

  def show
   
     @user  = User.find(params[:id])
      @title = @user.username
     
     if signed_in?
          @bookmarks = @user.bookmarks.paginate(:page => params[:page])
	  @bookmark = Bookmark.new
	  @feed_items = current_user.feed.paginate(:page => params[:page])
      end
  end
  
  def profile
   
    @user  = User.find(params[:id])
     @title = @user.username
    @bookmarks = @user.bookmarks.paginate(:page => params[:page])
   
  end
  #
  #
  ###
  def new
      @title = "Sign up"
      @user = User.new
  end
  ###
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the  Bookmarks App!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end
  ###
  def edit
   ## raise request.inspect
   # @user  = User.find(params[:id])
    @title = "Edit user"
  end
  ###
  def update
   # @user  = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, :flash => {:success => "Profile updated." }
    else
      @title = "Edit user"
      render 'edit'
    end 
  end
  ###
  def destroy
    #User.find(params[:id]).destroy
    @user.destroy
    redirect_to root_path, :flash => {:success => "User destroyed."}
    #redirect_to users_path, :flash => {:success => "User destroyed."}

  end
  private
   
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    ###
    def admin_user
        #user = User.find(params[:id])
        @user = User.find(params[:id])
        redirect_to(root_path) unless (!current_user.admin?  || current_user?(user))
    end
    
end
