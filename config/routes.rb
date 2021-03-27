Rails.application.routes.draw do
  root 'sessions#home'
  
  resources :users do
    resources :tasks
  end
  resources :tasks
  resources :projects
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
