Rails.application.routes.draw do
  get 'products/index'

  get 'products/new'

  get 'products/show'

  get 'users/index'

  get 'users/show'

  get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
