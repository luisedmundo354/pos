Rails.application.routes.draw do
  resources :customers
  resources :replenishers
  resources :purchase_orders
  resources :sale_orders
  resources :purchase_items
  resources :sale_items
  root 'products#index'
  resources :products, :categories, :suppliers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
