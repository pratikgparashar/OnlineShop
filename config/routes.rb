Rails.application.routes.draw do
  resources :orders
  get 'sessions/new'

  get 'store/index'
  root "store#index"

resources :products
resources :users
resources :carts
resources :line_items, :only => [:create,:destroy] 

  get  'help' => 'store#help'
  get  'about'=> 'store#about'
  get  'contact' => 'store#contact'
  get  'signup' => 'users#new'
  post 'signup'=> 'users#create'
  get 'login'=> 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
 
  # get 'carts'=>'carts#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
