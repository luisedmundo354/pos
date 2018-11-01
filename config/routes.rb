Rails.application.routes.draw do
  resources :customers
  resources :replenishers
  resources :purchase_orders
  resources :sale_orders
  resources :purchase_items
  resources :sale_items
  root 'products#index'
  get 'products/list', to: 'products#list', as: 'list_items'
  resources :products, :categories, :suppliers
  resources :sale_orders do
    post :sale_item_fields, on: :collection
  end
  resources :purchase_orders do
    post :purchase_item_fields, on: :collection
    post :purchase_results, on: :collection
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
