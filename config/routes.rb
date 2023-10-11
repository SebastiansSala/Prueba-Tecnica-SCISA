Rails.application.routes.draw do
  
  resources :categories do
    resources :products
  end

  # get 'categories', to: 'categories#index', as: 'categories'
  # get 'categories/new', to: 'categories#new', as: 'new_category'
  # post 'categories', to: 'categories#create'
  # get 'categories/:id', to: 'categories#show', as: 'category'
  # get 'categories/:id/edit', to: 'categories#edit', as: 'edit_category'
  # patch 'categories/:id', to: 'categories#update'
  # put 'categories/:id', to: 'categories#update'
  # delete 'categories/:id', to: 'categories#destroy'
  

  # get 'categories/:category_id/products', to: 'products#index', as: 'category_products'
  # get 'categories/:category_id/products/new', to: 'products#new', as: 'new_category_product'
  # post 'categories/:category_id/products', to: 'products#create'
  # get 'categories/:category_id/products/:id', to: 'products#show', as: 'category_product'
  # get 'categories/:category_id/products/:id/edit', to: 'products#edit', as: 'edit_category_product'
  # patch 'categories/:category_id/products/:id', to: 'products#update'
  # put 'categories/:category_id/products/:id', to: 'products#update'
  # delete 'categories/:category_id/products/:id', to: 'products#destroy'



  root 'categories#index'
end
