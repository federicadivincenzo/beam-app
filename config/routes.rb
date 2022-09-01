Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "review", to: "reviews#home"
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :concerts, only: %i[index show] do
    resources :users_concerts, only: :create
  end
  resources :chatrooms, only: %i[index show] do
    resources :messages, only: :create
  end
end
