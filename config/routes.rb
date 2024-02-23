Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, only: [:show]
  get "buddies/:id", to: "users#buddy", as: :buddy
  post "buddies/:id/reviews", to: "reviews#create", as: :buddy_reviews

  resources :private_chatrooms, only: [:index] do
    resources :private_messages, only: [:create]
  end

  resource :private_chatrooms, only: [] do
    member do
      get ":buddy_id", to: "private_chatrooms#show", as: :show
    end
  end

  resources :parks do # Modification ici
    collection do
      get 'fetch' # Ajoute la route /parks/fetch pour l'action fetch
    end
    resources :favorites, only: [:create]
  end

  resources :chatrooms
end
