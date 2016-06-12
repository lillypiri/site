Rails.application.routes.draw do
  resources :tags, only: [:show]
  root to: 'home#index'
end
