Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'
  resources :users, only: %i[show] do
    resources :reviews, only: %i[create new]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :concerts, only: %i[index show] do
    resources :users_concerts, only: %i[create]
  end
  resources :chatrooms, only: %i[show index] do
    resources :messages, only: %i[create]
  end

end
