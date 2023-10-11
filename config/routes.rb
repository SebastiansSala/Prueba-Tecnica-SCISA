Rails.application.routes.draw do
  resources :categories
  resources :products

  root 'categories#index'
end
