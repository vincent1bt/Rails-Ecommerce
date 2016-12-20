Rails.application.routes.draw do
  root "products#index"

  get "/signup" => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :products
  resources :users, except: [:index, :destroy]

  resources :cart_items, only: [:create, :destroy]
  get "/cart", to: "carts#show"
  get "/add/:product_id", as: :add_to_cart, to: "cart_items#create"

  get '/checkout', to: "payments#checkout"
  post "/pay", to: "payments#create"
  #post "/payments/card", to "payments#process_card"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
