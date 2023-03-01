Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :garages do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index]
  get "dashboard", to: "pages#dashboard"
  # Defines the root path route ("/")
  # root "articles#index"
end
