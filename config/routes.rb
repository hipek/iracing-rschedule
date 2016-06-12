Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :seasons
  end

  namespace :admin do

  end

  resources :teams, only: :index
  resources :seasons, only: :index

  root 'teams#index'
end
