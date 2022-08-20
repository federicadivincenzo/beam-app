Rails.application.routes.draw do
  devise_for :users
  root to: 'concerts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :concerts, only: [:index, :show]

end
