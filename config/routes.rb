Rails.application.routes.draw do
  resources :videos
  resources :statistics
  get 'schools/new'
  get 'schools/create'
  devise_for :users, controllers: { registrations: "users/registrations" }
  root 'pages#home'
  resources :schools, only: [:new, :create]
  get '/complete', to: 'pages#complete', as: 'finish_user'
  get '/athlete/:id', to: 'pages#athlete', as: 'athlete'
  get '/athletes', to: 'pages#athletes', as: 'athletes'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
