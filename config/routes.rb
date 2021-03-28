Rails.application.routes.draw do
  
  # landing page
  root 'sessions#home'

  # login
  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  # logout

  get 'logout', to: 'sessions#destroy'
  
  resources :users, only: [:new, :create] do
    resources :tasks, only: [:index, :show, :new]
  end
  
  resources :comments
  resources :projects
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
