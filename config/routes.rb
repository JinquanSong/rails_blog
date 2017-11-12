Rails.application.routes.draw do
  root to: 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login' => 'admin/sessions#new'
  get '/logout' => 'admin/sessions#destroy'

  namespace :admin do
    resources :posts
    resources :settings, only: [:new, :create, :edit, :update]
    resources :dashboard, only: [:index]
    resources :notifications, only: [:index, :destroy]
    resources :messages, only: [:index, :show, :update, :destroy]
    resources :visitors, only: [:index, :destroy]
    resources :comments, only: [:index, :update, :destroy]
    resources :tags, except: [:new]
    resources :moderators, only: [:index, :edit, :update]
    resources :sessions, only: [:new, :create, :destroy]
  end

  resources :posts, only: [:index, :show] do
    collection do
      get :archive
    end
  end
  resources :messages, only: [:new, :create]
  resources :comments, only: [:create]
  resources :about, only: [:index]
  resources :contact, only: [:new, :create]

  match 'dismiss_all_notifications', to: 'admin/notifications#delete_all', via: :delete
end
