Rails.application.routes.draw do
#   root to: redirect('/habbits')

# get 'habbits', to: 'site#index'
# get 'habbits/new', to: 'site#index'
# get 'habbits/:id/edit', to: 'site#index'

  # post '/api-keys', to: 'api_keys#create'
  # delete '/api-keys', to: 'api_keys#destroy'
  # get '/api-keys', to: 'api_keys#index'
resources :api_keys, path: 'api-keys', only: %i[index create destroy] 

  namespace :api do
    namespace :v1 do
      resources :habbits, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
