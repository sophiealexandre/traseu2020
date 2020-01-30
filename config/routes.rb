Rails.application.routes.draw do
  devise_for :users
  get '/users/:id', to:'users#show', as: 'user'
  root to: 'searches#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :searches, only: [ :index, :new, :create ]

  resources :itineraries, only: [ :new, :create, :show, :destroy ] do
    resources :cities, only: [] do
      resource :itinerary_cities, only: [:update]
    end
    resource :bookmarks, only: [:update]
  end
  # get '/search', to: 'itineraries#search', as: 'search_itineraries'
  # resources :bookmarks, only: [ :index, :destroy, :create ]
  get '/bookmarks', to: 'bookmarks#index', as: 'bookmarks'
  post '/itineraries/:id', to: 'bookmarks#create', as: "create_bookmark"
  delete '/bookmarks', to: 'bookmarks#destroy'

  # resources :itinerary_cities, only: [ :destroy, :create ]
  # post '/itinerary_cities', to: 'itineraries#create_itinerary_city', as: "create_itinerary_city"
  # delete '/itineraries/:id/cities/:city', to: 'itineraries#destroy_itinerary_city', as: "delete_itinerary_city"

  get '/pages', to: 'pages#home'
  get '/pages/print', to: 'pages#print'

  resources :itinaries_spots, only: [ :destroy, :create ]
  resources :cities, only: [ :show ]
end
