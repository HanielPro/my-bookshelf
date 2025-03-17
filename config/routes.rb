Rails.application.routes.draw do
  resources :rentals do
    member do
      patch "return_book"  # Endpoint para devolução do livro
      patch "extend_return_estimate_date"  # Endpoint para prolongar o prazo de devolução
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
