Project3::Application.routes.draw do
  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :bookmarks 
  resources :pages
  post '/users#profile'
  root 		        :to => 'sessions#new'
  match '/signin',       :to => 'sessions#new'
  match '/signout',      :to => 'sessions#destroy'

  match '/show',         :to => 'users#show'
  match '/signup', 	 :to => 'users#new'
  match '/edit',         :to => 'users#edit'
  match '/index',        :to => 'users#index'
  #match '/profile',       :to => 'users#profile'

  
  match '/help', :to => 'pages#help'
  match '/search', :to => 'pages#search'
 
  match '/show', :to => 'bookmarks#show'
  match '/index', :to => 'bookmarks#index'

end
