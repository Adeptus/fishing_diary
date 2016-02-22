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

  root to: 'dashboard#index'
end
