Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :lists # Add other routes as needed
  resources :words

  get "words", to: "words#show"

  # get "lists", to: "lists#show"

  get 'search', to: 'dictionary#show'

  get 'search', to: 'dictionary#search', as: 'dictionary_search'


  post '/dictionary/add_to_list', to: 'dictionary#add_to_list', as: 'add_to_list'

  get '/dictionary/word_list', to: 'dictionary#word_list', as: 'word_list'

  get 'home', to: "home#index"

  post '/add_to_dictionary', to: 'words#add_to_dictionary'

  resources :lists



  # devise_for :users
  root to: "home#index"


end