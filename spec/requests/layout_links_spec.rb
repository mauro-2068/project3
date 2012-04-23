require 'spec_helper'

describe "LayoutLinks" do

      it "should have a Home page at '/'" do
	    get '/'
	response.should have_selector('title', :content => "Sign in")
      end
      #
      it "should have a Search page at '/search'" do
	    get '/search'
	    response.should have_selector('title', :content => "Search")
      end 
      #
  
      it "should have a Help page at '/help'" do
	    get '/help'
	    response.should have_selector('title', :content => "Help")
      end 
      #
      it "should have a signup at '/signup'" do
	    get '/signup'
	    response.should have_selector('title', :content => "Sign up")
      end
      #  
      it "should have a signin page at '/signin'" do
	    get '/signin'
	    response.should have_selector('title', :content => "Sign in")
      end
      #
      it "should have the right links on the layout" do
	    visit root_path
        response.should have_selector('title', :content => "Sign in")
	click_link "Search"
	    response.should have_selector('title', :content => "Search")
	click_link "Help"
	    response.should have_selector('title', :content => "Help")
        click_link "Sign Up"
	    response.should have_selector('title', :content => "Sign up")
	response.should have_selector('a[href="/"]>img')    
      end
      
      #
      describe "when not signed in" do
	it "should have a signin link" do
	  visit root_path
	  response.should have_selector("a", :href => signin_path, :content => "Sign in")
	end
      end
      #
      describe "when signed in" do
	  before(:each) do
	    @user = Factory(:user)
	    visit signin_path
	    fill_in :email,  	:with => @user.email
	    fill_in :password, 	:with => @user.password
	    click_button
	  end
	  #
	  it "should have a signout link" do
	    visit root_path
	    response.should have_selector("a", :href => signout_path, :content => "Logout")
	  end
	  # 
	  it "should have a profile link" do
	      visit root_path
	      response.should have_selector("a", :href => profile_path,
					       :content => "Profile")
	  end
	  #
	  it "should have a settings link" do
	      visit root_path
	      response.should have_selector("a", :href => edit_user_path(@user),
					       :content => "Settings")
	  end
	  ####
          it "should have a users link" do
	      visit root_path
	      response.should have_selector("a", :href => users_path,
					           :content => "Users")
	  end
	  
      end
end