Project3::Application.routes.draw do
  resources :sessions, :only => [:new, :create, :destroy]
  resources :users
  resources :bookmarks
  resources :pages

  
  root 		        :to => 'sessions#new'
  match '/contact',     :to => 'pages#contact'
  match '/about', 	:to => 'pages#about'
  match '/help',	:to => 'pages#help'

  match '/show',         :to => 'users#show'
  match '/signup', 	 :to => 'users#new'
  match '/signin',       :to => 'sessions#new'
  match '/signout',      :to => 'sessions#destroy'
  
  match '/breed',       :to => 'demos#breed'
  

 
  root :to => 'users#login'
  
 
  match '/help', :to => 'pages#help'
  match '/search', :to => 'pages#search'

  
  
  match '/signup', :to => 'users#signup'
  match '/edit', :to => 'users#edit'
  match '/logged', :to => 'users#logged'
  match '/index', :to => 'users#index'
  
  
  match '/show', :to => 'bookmarks#show'
  match '/index', :to => 'bookmarks#index'

end
