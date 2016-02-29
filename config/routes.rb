Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :producers
  resources :baits
  resources :bait_types
  resources :fish
  resources :expeditions do
    resources :expedition_fishes, except: [:index, :show] do
      patch :destroy_selected, on: :collection
    end
  end
  resources :places
  resources :catch_methods
  resources :comments, only: [:create, :destroy]

  root to: 'dashboard#index'

  namespace :json do
    resources :comments, only: [:index] do
      get :children_comments, on: :member
    end
  end
end
