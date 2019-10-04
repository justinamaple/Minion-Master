Rails.application.routes.draw do

  root to: 'accounts#index'
  resources :accounts, except: [:edit, :destroy] do
    resources :inventory, only: [:index] do
      resources :items, only: [:destroy]
    end
    resources :characters, except: [:edit]
  end
  post '/login', to: 'authentication#login'
  post '/logout', to: 'authentication#logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
