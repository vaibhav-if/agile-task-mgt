Rails.application.routes.draw do
  # resources :phases
  # resources :tasks
  devise_for :users
  resources :projects do
    resources :tasks do
      resources :attachments
      resources :comments
      resources :sub_tasks
    end
  end
  root 'projects#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
