Rails.application.routes.draw do
  # resources :journals
  # resources :tasks
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users
    #   post '/login', to: 'auth#create'
    #   get '/profile', to: 'users#profile'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :journals
    #   post '/login', to: 'auth#create'
    #   get '/profile', to: 'users#profile'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :tasks
    #   post '/login', to: 'auth#create'
    #   get '/profile', to: 'users#profile'
    end
  end
end
