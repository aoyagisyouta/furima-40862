Rails.application.routes.draw do
  get 'purchases/index'
  devise_for :users
  root to: 'items#index'
<<<<<<< HEAD
  resources :items do
    resources :purchases, only: [:index,:create]
  end
  resources :purchase_addresses
=======
  resources :items do 
    resources :purchases, only: [:index, :create]
  end
>>>>>>> d31ad30df2a9ca5b3e8e10d7d46b3c6b4ee87864
end 
