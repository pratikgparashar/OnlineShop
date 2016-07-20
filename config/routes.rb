Rails.application.routes.draw do
  
    
  root "store#index"
  resources :orders
  resources :users
  resources :carts
  resources :line_items, :only => [:create,:destroy] 
  resources :products do
    get :who_bought, :on => :member
  end
  get  'help' => 'store#help'
  get  'about'=> 'store#about'
  get  'contact' => 'store#contact'
  get 'sessions/new'
  get 'store/index'
  get  'signup' => 'users#new'
  post 'signup'=> 'users#create'
  get 'login'=> 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

 
  # get 'carts'=>'carts#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
