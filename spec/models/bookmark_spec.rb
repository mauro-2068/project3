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
    ###
    describe "validations" do
        #
        before(:each) do
           @attr = {:url => "http://flordelpalenque.com", :name => "Flor Del Palenque"}
        end
        ##
        it "should require a user id" do
            Bookmark.new(@attr).should_not be_valid  
        end
        ###
        it "should require a nonblank url " do
            @user.bookmarks.build(:url => " ").should_not be_valid
        end
        it "should require a nonblank name " do
            @user.bookmarks.build(:name => " ").should_not be_valid
        end
        it "should reject long urls" do
            @user.bookmarks.build(:url => "a" * 141).should_not be_valid
        end
        it "should reject long names" do
            @user.bookmarks.build(:name => "a" * 141).should_not be_valid
        end
    end
end
