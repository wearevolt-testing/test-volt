Rails.application.routes.draw do
  use_doorkeeper
  root to: 'visitors#index'
  devise_for :users
  resources :users

  namespace :api do
    namespace :v1 do
      resources :posts
    end
  end
end
