Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'
  get "review", to: "reviews#home"
  get "map", to:'concerts#map', as: :map
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :concerts, only: %i[index show] do
    resources :users_concerts, only: :create
  end
  resources :chatrooms, only: %i[show index] do
    resources :messages, only: :create
  end
end
