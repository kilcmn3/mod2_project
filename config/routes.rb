Rails.application.routes.draw do
  root 'users#index'

  resources :photos
  resources :posts
  resources :user_locations
  resources :locations
  resources :users
  get '/sessions/loggin', to: 'sessions#authentication', as: 'loggin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
