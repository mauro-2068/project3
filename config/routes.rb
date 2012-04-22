Project3::Application.routes.draw do

    resources :sessions, :only => [:new, :create, :destroy]
    resources :users
    resources :bookmarks 
    resources :pages
       
    root 		    :to => 'sessions#new'
    
    #-----  Session routes -------------------#
    match '/signin',        :to => 'sessions#new'
    match '/signout',       :to => 'sessions#destroy'
    
    #-----  Users routes   -------------------#
    match '/index',         :to => 'users#index'
    match '/show',          :to => 'users#show'
    match '/signup', 	    :to => 'users#new'
    match '/edit',          :to => 'users#edit'
    match '/profile',       :to => "users#profile" 
    
    #-----  Pages routes ---------------------#
    match '/help',          :to => 'pages#help'
    match '/search',        :to => 'pages#search'
    match '/home',          :to => 'pages#home'
     
    #-----  Bookmarks routes ----------------#
    match '/show', :to => 'bookmarks#show'
    match '/index', :to => 'bookmarks#index'

end
