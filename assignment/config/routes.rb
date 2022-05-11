Rails.application.routes.draw do

  get 'home/index'
  root to: 'home#index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :posts do
    collection{post :import}
  end

  get 'search', to: 'users#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
