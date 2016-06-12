Rails.application.routes.draw do
  resources :photos, only: [:show]
  resources :tags, only: [:show]
  root to: 'home#index'
end
