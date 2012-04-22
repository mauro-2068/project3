class BookmarksController < ApplicationController
    before_filter :authenticate
    before_filter :authorized_user, :only => :destroy
   
    # GET /bookmarks
    def index
        @bookmarks = Bookmark.all
    end
    ###
    #GET /bookmarks/1
    def show
        @bookmark = Bookmark.find(params[:id])
    end
    ###
    #GET /bookmarks/new
    def new
        @bookmark = Bookmark.new
        @title = "New Bookmark"
    end
    ####
    # GET /bookmarks/1/edit
    def edit
        @bookmark = Bookmark.find(params[:id])
    end
    ####
    # POST /bookmarks
     def create
        @bookmark = current_user.bookmars.build(params[:bookmark])
        if @bookmark.save
            redirect_to root_path, :flash => {:success => "Bookmark created!"}
        else
            @feed_items = []
            render 'users/show'
        end
    end
    
    # PUT /bookmark/1
    def update
        @bookmark = Bookmark.find(params[:id])
        respond_to do |format|
            if @bookmark.update_attributes(params[:bookmark])
                format.html { redirect_to @bookmark, notice: 'Bookmark was successfully updated.' }
                format.json { head :ok }
            else
                format.html { render action: "edit" }
                format.json { render json: @bookmark.errors, status: :unprocessable_entity }
            end
        end
    end
    ###
    # DELETE /bookmarks/1
    def destroy
         @bookmark.destroy
        redirect_to current_user, :flash => {:success => "Bookmark deleted!"}
    end
    ####
    private
        def authorized_user
            @bookmark = Bookmark.find(params[:id])
            redirect_to root_path unless current_user?(@bookmark.user)
        end
end