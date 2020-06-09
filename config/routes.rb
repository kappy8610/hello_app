Rails.application.routes.draw do
  root 'home#index'
  get '/sign_up', to:'users#new'
  # get '/show', to: 'users#show'
  resources :users
end
