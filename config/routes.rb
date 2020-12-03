Rails.application.routes.draw do
  # resources :journals
  # resources :tasks
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users 
      resources :journals 
      resources :tasks 
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/by_email/:email_address', to: 'users#login'
    end
  end

end 
