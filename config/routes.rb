Rails.application.routes.draw do
  get 'sessions/new'

  get 'store/index'
  root "store#index"

resources :products
resources :users
resources :carts, only: [:show, :index]

  get 'products/index'

  get 'products/edit'

  get 'products/show' 

  get 'products/new'

  get 'products/_form'

  get  'help' => 'store#help'
  get  'about'=> 'store#about'
  get  'contact' => 'store#contact'
  get  'signup' => 'users#new'
  post 'signup'=> 'users#create'
  get 'login'=> 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'


  post 'line_items'=>'line_items#create'
  # get 'carts'=>'carts#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
