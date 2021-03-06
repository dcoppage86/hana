Rails.application.routes.draw do
  
  # landing page
  root 'sessions#home'

  # login
  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  # logout

  get 'logout', to: 'sessions#destroy'

  match '/auth/:google_oauth2/callback' => 'sessions#omniauth', via: [:get, :post]

  
  resources :sessions 

  resources :users, only: [:new, :create] do
    resources :tasks, only: [:index]
  end

  resources :projects do
    resources :tasks, only: [:new]
  end

  resources :tasks
  resources :comments

  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
