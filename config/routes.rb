Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'

  resources :users, only: [] do
    resources :task_lists
  end

  resources :task_lists, only: [] do
    resources :tasks, only: [:show, :new, :create, :edit, :update, :destroy]
  end
end
