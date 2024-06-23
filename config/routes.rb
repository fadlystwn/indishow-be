Rails.application.routes.draw do
  get 'sessions/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :api do
    namespace :v1 do
      resources :artists do
        resources :albums
      end
    end
  end

  # Profile
  resource :profile, only: [:show, :update]

  # Login
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Register
  post '/register', to: 'users#create'


  # Forgot Password
  post '/forgot_password', to: 'passwords#forgot'
  post '/reset_password', to: 'passwords#reset'
end
