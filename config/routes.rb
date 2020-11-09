Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root 'pages#home'
  get '/pages/scouts', to: 'pages#scout', as: 'finish_scout'
  get '/pages/athletes', to: 'pages#athlete', as: 'finish_athlete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
