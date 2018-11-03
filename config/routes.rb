Rails.application.routes.draw do
  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]

  namespace :api do
    namespace :v1 do
      resources :users do
        post 'favorites', to: 'users/favorites#create'
      end
    end
  end

end
