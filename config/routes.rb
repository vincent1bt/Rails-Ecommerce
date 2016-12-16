Rails.application.routes.draw do

  root "products#index"


  get "/signup" => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :products
  resources :users, except: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
