Rails.application.routes.draw do
  get 'sign_up', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'logout', to: 'sessions#logout'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'users/new'
  get 'users/create'
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  resources :microposts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "sessions#welcome"

  resources :articles do
    resources :comments
  end
  resources :password_resets, only: [:new, :create, :edit, :update]
end
