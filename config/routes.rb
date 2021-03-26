Rails.application.routes.draw do

  root 'welcome#home'
  
  devise_for :users
  resources :tasks
  resources :projects
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
