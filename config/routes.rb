Rails.application.routes.draw do
  namespace :api do
  get 'events/create'
  end

  get 'events/create'

  resources :registered_applications, except: [:edit, :update]
  devise_for :users
  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end
  get 'about' => 'welcome#about'
  root 'welcome#index'
  end
