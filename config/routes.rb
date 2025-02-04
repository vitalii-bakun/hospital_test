Rails.application.routes.draw do
  root 'pagas#home'

  namespace :doctors do
    resources :recommendations, only: %i[index edit update]
    resource :profile, only: %i[show]
  end

  namespace :patients do
    resources :doctors, only: %i[index]
    resource :profile, only: %i[show]
    resources :recommendations, only: %i[index create]
  end

  devise_for :users, controllers: {
    # confirmations: 'users/confirmations',
    # omniauth_callbacks: 'users/omniauth_callbacks',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
    # unlocks: 'users/unlocks'
  }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
