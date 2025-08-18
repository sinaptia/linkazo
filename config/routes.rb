Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  # Root route
  root 'home#index'
  
  # Dashboard routes (authenticated users)
  get 'dashboard', to: 'links#index'
  resources :links, except: [:show]
  
  # Profile management
  get 'settings', to: 'profiles#edit'
  patch 'settings', to: 'profiles#update'
  
  # Public profile routes (must be last to catch usernames)
  get ':username', to: 'profiles#show', as: :profile
  
  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
