Rails.application.routes.draw do
  devise_for :users
  resources :groundbaits
  resources :producers
  resources :baits
  resources :bait_types
  resources :fish
  resources :expeditions do
    resources :expedition_fishes, except: [:index, :show]
  end
  resources :places
end
