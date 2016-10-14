Rails.application.routes.draw do
  root to: 'dashboard#index'
  
  devise_for :users

  resources :sales
  resources :sale_details


  resources :items
  resources :units
  resources :towns
  resources :categories
  resources :brands

  get 'validate_suggested_brand/index'
  get '/brands_suggestion', to: 'brands_suggestion#index'
  get '/validate_suggested_brand', to: 'validate_suggested_brand#index'


  #get 'validate_suggested_brand/index'
  get '/items_suggestion', to: 'items_suggestion#index'
  #get '/validate_suggested_brand', to: 'validate_suggested_brand#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
