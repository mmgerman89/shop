Rails.application.routes.draw do
  resources :sales
  get 'validate_suggested_brand/index'

  resources :items
  resources :units
  resources :towns
  resources :categories
  resources :brands
  devise_for :users
  root to: 'dashboard#index'

  get '/brands_suggestion', to: 'brands_suggestion#index'
  get '/validate_suggested_brand', to: 'validate_suggested_brand#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
