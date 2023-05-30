Rails.application.routes.draw do
  resources :kinds

  resources :contacts do
    resource :kind, only: [:show], path: 'kind'
    resource :kind, only: [:show], path: 'relationships/kind'
  
    resource :phones, only: [:show]
    resource :phones, only: [:show], path: 'relationships/phones'
    
    resource :phone, only: [:create, :update, :destroy]
    resource :phone, only: [:update, :create, :destroy], path: 'relationships/phones'
    
    resource :address, only: [:show, :update, :create, :destroy], path: 'address'
    resource :address, only: [:update, :create, :destroy, :show], path: 'relationships/address'

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
