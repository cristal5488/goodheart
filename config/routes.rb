Rails.application.routes.draw do
  resources :events do
    resources :analytics
    # resources :donors
  end

  root 'dashboard#index'

  get '/health_provider_signup'=> 'health_providers#new'
  post '/health_providers' => 'health_providers#create'
  get '/donor_signup'=> 'donors#new'
  post '/donors' => 'donors#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/events/index' => 'events#index'
  get '/events/new' => 'events#new'

  # get '/donors/edit' => 'donors#edit'
  resource :donor

end
