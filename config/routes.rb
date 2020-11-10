Rails.application.routes.draw do
  get 'schools/new'
  get 'schools/create'
  devise_for :users, controllers: { registrations: "users/registrations" }
  root 'pages#home'
  resources :traits, only: [:new, :create]
  resources :schools, only: [:new, :create]
  get '/finish-profile', to: 'pages#finish_user', as: 'finish_user'
  get '/athlete/:id', to: 'pages#user_profile', as: 'athlete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
