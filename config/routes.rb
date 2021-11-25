Rails.application.routes.draw do
  resources :attachments
  resources :comments
  resources :sub_tasks
  resources :tasks
  devise_for :users
  resources :projects
  root 'projects#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
