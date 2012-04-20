Project3::Application.routes.draw do
  resources :sessions, :only => [:new, :create, :destroy]
  resources :users
  resources :bookmarks
  resources :pages
  
  root 		        :to => 'sessions#new'

  match '/show',         :to => 'users#show'
  match '/signup', 	 :to => 'users#new'
  match '/signin',       :to => 'sessions#new'
  match '/signout',      :to => 'sessions#destroy'
  
  match '/help', :to => 'pages#help'
  match '/search', :to => 'pages#search'

  match '/edit', :to => 'users#edit'
  match '/index', :to => 'users#index'
 
  match '/show', :to => 'bookmarks#show'
  match '/index', :to => 'bookmarks#index'

end
