Rails.application.routes.draw do
  resources :rentals do
    member do
      get "extend", to: "rentals#extend_return_date"  # Especificar a ação
      get "return", to: "rentals#return_rental"
    end
    end

  resources :books do
    collection do
      get "search"
    end
  end

  resources :users do
    collection do
      get "search"
    end
  end

  namespace :admin do
    get "dashboard", to: "dashboard#index"
  end

  resources :genres
  resources :authors

  # Endpoint de health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "home#index"
end
