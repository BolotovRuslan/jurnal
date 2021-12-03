Rails.application.routes.draw do
  root 'pages#index'

  resources :pages

  get '/add', to: 'pages#new'
  post '/add', to: 'pages#create'
end
