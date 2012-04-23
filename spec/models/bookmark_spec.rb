require 'spec_helper'

describe Bookmark do
  
    before(:each) do
        @user = Factory(:user)
        @attr = {:url => "http://flordelpalenque.com", :name => "Flor Del Palenque"}
    end  
    ###
    it "should create a new instance given valid attributes" do
      @user.bookmarks.create!(@attr)
    end
    ###
    
    describe "user associations" do
        #
        before(:each) do
          @bookmark = @user.bookmarks.create(@attr)
        end
        ###
        
        it "should have a user attribute" do
            @bookmark.should respond_to(:user)
        end
        ###
        it "should have the right associated user" do
            @bookmark.user_id.should == @user.id
            @bookmark.user.should == @user
        end
    end
end
