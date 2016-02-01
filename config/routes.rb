Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :producers
  resources :baits
  resources :bait_types
  resources :fish
  resources :expeditions do
    resources :expedition_fishes, except: [:index, :show]
  end
  resources :places

  root to: 'dashboard#index'
end
