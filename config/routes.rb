Rails.application.routes.draw do
  namespace :admin do
    resources :orders
    resources :items
    resources :products
  end
end
