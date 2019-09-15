Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies
  resources :users
  resources :equipment
  resources :customers do
     resources :rentals
  end
  
  resources :equipment
  
  
  
    get    '/signin',   to: 'sessions#new'
    post   '/signin',   to: 'sessions#create'
    delete '/signout',  to: 'sessions#destroy'
  
    root 'site#index'


end
