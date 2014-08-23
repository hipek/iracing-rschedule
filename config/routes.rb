Rails.application.routes.draw do
  scope Rails.application.config.relative_url_root do
    resources :teams
    resources :seasons
    resources :tracks
    resources :series, only: [:edit, :update, :index, :show]

    get 'welcome/index'

    root 'welcome#index'

    post 'series_track_values/:id', to: 'srs_track_values#update'

    scope path: ':team_id' do
      resources :user_seasons

      resources :users

      get 'home/index'
      get 'my_series/:id', to: 'home#show', as: :my_series

      get '/', to: 'home#index', as: :team_root
    end
  end
end
