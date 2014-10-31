Hydra::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { sessions: 'sessions' }

  namespace :api do
    namespace :v1 do
      resources :tournaments
    end
  end

  root 'home#index'
  get '*path', to: 'home#index'
  
  # match '/contact', to: 'static_pages#contact', via: 'get'
  # match '/how-to-play', to: 'static_pages#how_to_play', via: 'get'
  # match '/rules', to: 'static_pages#rules', via: 'get'

  # resources :tournaments, only: :index do
  #   resources :rounds, only: :index do
  #     resources :matches, only: :index
  #   end
  # end

  # # just adding this easy route that redirects to the latest
  # # tournaments rounds page
  # match '/tournaments/latest', to: 'tournaments#latest', via: 'get'

  # resources :user_tournament_scores, only: :index
  # # ladder path (will require a tournament=[as a param])
  # match '/ladder', to: 'user_tournament_scores#index', via: 'get'

  # resources :user_match_predictions, except: [:destroy, :new]

end
