Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :partner do
        post '/register', to: 'registrations#create'
      end
      post '/login', to: 'sessions#create'
      post '/logout', to: 'sessions#destroy'
    end
  end
end
