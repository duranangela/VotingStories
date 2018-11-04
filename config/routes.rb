Rails.application.routes.draw do
  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create] do
    resources :favorites, only: [:index]
  end

  namespace :api do
    namespace :v1 do
      resources :users do
        post 'favorites', to: 'users/favorites#create'
        delete 'favorites/:id', to: 'users/favorites#destroy'
      end
    end
  end

end
