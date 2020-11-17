Rails.application.routes.draw do
  get 'payments/success'
  resources :messages, only: [:show, :new, :create, :destroy]
  get '/conversations', to: 'pages#conversations', as: 'conversations'
  resources :conversations, only: [:show, :create, :destroy]
  resources :videos
  resources :statistics
  get '/offers', to: 'pages#offers', as: 'offers'
  resources :offers, only: [:create, :destroy, :update]
  get 'schools/new'
  get 'schools/create'
  devise_for :users, controllers: { registrations: "users/registrations" }
  root 'pages#home'
  resources :schools, only: [:new, :create]
  get '/complete', to: 'pages#complete', as: 'finish_user'
  get '/athlete/:id', to: 'pages#athlete', as: 'athlete'
  get '/athletes', to: 'pages#athletes', as: 'athletes'
  get '/upgrade', to: 'pages#upgrade', as: 'upgrade'
  post '/payments/webhook', to: 'payments#webhook'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
