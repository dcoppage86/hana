Rails.application.routes.draw do
  # landing page
  root 'sessions#home'

  # login
  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'
  
  resources :users do
    resources :projects
  end
    
  resources :projects, only: [:show] do
      resources :tasks, only: [:new]
  end


  resources :projects
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
