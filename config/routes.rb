Rails.application.routes.draw do
  root 'users#index'

  resources :photos
  resources :posts
  resources :user_locations
  resources :locations
  resources :users
  get '/sessions/log_in', to: 'sessions#authentication', as: 'loggin'
  get '/sessions/log_out', to: 'sessions#log_out', as: 'log_out'

 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
