Rails.application.routes.draw do
  resources :registered_applications, except: [:edit, :update]
  devise_for :users
  get 'about' => 'welcome#about'
  root 'welcome#index'
  end
