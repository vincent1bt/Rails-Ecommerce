Rails.application.routes.draw do
  root "products#index"

  get "/signup" => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :products
  resources :users, except: [:index, :destroy, :show]

  get '/user', as: :user_profile, to: 'users#show'
  resources :cart_items, only: [:create, :destroy]
  get "/cart", to: "carts#show"
  get "/add/:product_id", as: :add_to_cart, to: "cart_items#create"
  delete "/remove/:product_id", as: :remove_from_cart, to: "cart_items#destroy"

  get '/checkout', to: "payments#checkout"
  post "/pay", to: "payments#create"
  post '/pay_card', to: "payments#create_card"
  #post "/payments/card", to "payments#process_card"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
