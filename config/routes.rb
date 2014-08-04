Rails.application.routes.draw do

  root 'products#index'

  get 'login' => 'sessions#new'
  post 'sessions' => 'sessions#create'
  
  delete 'logout' => 'sessions#destroy'

  get 'addToCart' => 'orders#addToCart'
  post 'addToCart' => 'orders#addToCart'

  post 'orderComplete' => 'orders#orderComplete'


  resources :users do
  	resources :cards
    resources :orders
  end

  resources :products

end
