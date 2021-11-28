Rails.application.routes.draw do
  resources :phases
  # resources :attachments
  # resources :comments
  devise_for :users
  resources :projects do
    resources :tasks
  end
  resources :tasks do
    resources :sub_tasks
  end
  root 'projects#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
