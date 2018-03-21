Rails.application.routes.draw do
  resources :bills ,except: [:edit ,:update] do
    # member do
    #   get 'bill_parts' , to: 'bills#bill_parts'
    # end
  end
  devise_for :users
  root 'static#home'
  get '/home',to: 'static#home' , as: 'home'
  get 'bill_parts' , to: 'bills#bill_parts'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
