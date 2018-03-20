Rails.application.routes.draw do
  resources :bills ,except: [:edit ,:update]
  devise_for :users
  root 'static#home'
  get '/home',to: 'static#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
