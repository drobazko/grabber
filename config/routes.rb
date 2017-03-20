Rails.application.routes.draw do
  root 'products#new'
  resources :products, except: [:update, :destroy]
end
