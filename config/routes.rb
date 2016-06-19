Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :teams do
      resources :members, controller: :team_members
    end
    resources :seasons
    resources :tracks

    root 'seasons#index'
  end

  namespace :api do
    resources :seasons
  end

  resources :teams, only: :index
  resources :seasons, only: :index

  root 'teams#index'
end
