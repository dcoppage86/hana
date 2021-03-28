Rails.application.routes.draw do
  # landing page
  root 'sessions#home'

  # login
  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'
  
  resources :users do
    resources :projects
  end
    
  resources :projects do
      resources :comments
  end

  resources :comments
  resources :projects
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
