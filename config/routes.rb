Rails.application.routes.draw do
  root 'users#index'

  resources :photos
  resources :posts
  resources :user_locations
  resources :locations, only:[:index, :show, :new, :create]
  resources :users, only:[:index, :new, :create, :update, :destroy]
  get '/sessions/log_in', to: 'sessions#authentication', as: 'loggin'
  get '/sessions/log_out', to: 'sessions#log_out', as: 'log_out'
  get '/users/profile', to: 'users#show'
  get '/users/profile/edit', to: 'users#edit', as: 'user_edit'

 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
