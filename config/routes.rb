Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # methods edit et update à revoir !!!

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
  resources :parks, only: [:index, :show] do
    collection do
      get 'fetch' # Ajoute la route /parks/fetch pour l'action fetch
    end
    resources :favorites, only: [:create]
  end
  resources :chatrooms, only: [:index, :show] do
    resources :messages, only: [:create]
  end
  resources :favorites, only: [:destroy]
end
