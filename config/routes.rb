# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/me', to: 'users#show'
      post '/register', to: 'registrations#create'
      post '/login', to: 'sessions#create'
      post '/logout', to: 'sessions#destroy'

      namespace :partners do
        resources :customers, only: %i[index]
      end

      resources :addresses, only: %i[index destroy update]
    end
  end
end
