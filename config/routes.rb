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
      resources :comments, only: [:index, :show]
  end

  resources :comments
  resources :projects
  resources :users, except: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
