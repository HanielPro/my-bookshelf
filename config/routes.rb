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

  # Define a rota inicial da aplicação (pode ser ajustada conforme necessário)
  root "rentals#index"
end
