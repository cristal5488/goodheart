Rails.application.routes.draw do
  resources :events do
    resources :analytics
  end

  root 'dashboard#index'

  get '/health_provider_signup'=> 'health_providers#new'
  post '/health_providers' => 'health_providers#create'
  get '/donor_signup'=> 'donors#new'
  post '/donors' => 'donors#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # get '/analytics' => 'analytics#new'
  # post '/analytics' => 'analytics#create'


end
