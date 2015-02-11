Rails.application.routes.draw do
  namespace :admin do
    root 'orders#index'
    resources :orders
    resources :items
    resources :products
  end
end
