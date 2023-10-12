Rails.application.routes.draw do
  
  resources :categories do
    resources :products
  end

  # get 'categories'
  # get 'categories/new'
  # post 'categories'
  # get 'categories/:id'
  # get 'categories/:id/edit'
  # patch 'categories/:id'
  # put 'categories/:id'
  # delete 'categories/:id'
  

  # get 'categories/:category_id/products'
  # get 'categories/:category_id/products/new'
  # post 'categories/:category_id/products'
  # get 'categories/:category_id/products/:id'
  # get 'categories/:category_id/products/:id/edit'
  # patch 'categories/:category_id/products/:id'
  # put 'categories/:category_id/products/:id'
  # delete 'categories/:category_id/products/:id'

  root 'categories#index'
end




