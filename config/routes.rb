Rails.application.routes.draw do
resources :products

  get 'products/index'

  get 'products/edit'

  get 'products/show' 

  get 'products/new'

  get 'products/_form'

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
