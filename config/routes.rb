Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Root path (shows all customers)
  root "customers#index"

  # Customers routes
  resources :customers, only: [:index] do
    collection do
      get 'missing_email', to: 'customers#missing_email'
      get 'alphabetized', to: 'customers#alphabetized'
    end
  end
end