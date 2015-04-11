Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'

  resources :task_lists do
    resources :tasks, only: [:show, :new, :create, :edit, :update, :destroy]
  end
end
