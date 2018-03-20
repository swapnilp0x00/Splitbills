Rails.application.routes.draw do
  root 'static#root'
  get '/home',to: 'static#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
