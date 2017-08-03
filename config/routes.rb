Rails.application.routes.draw do
  get 'apps/index'

  get 'channels/index'

  resources :questions, only: [:show, :create]

  post 'sales/create'

  get 'sales/show'

  resources :services
  get 'prices/index'

  get 'prices/show'

  root   'welcome#index'

  resources :sessions, only: [:new, :create, :destroy]

    get '/logout' => "sessions#destroy"

  resources :users, except: [:destroy, :index]

  get '/:token/confirm_email/', :to => "users#confirm_email", as: 'confirm_email'

  resources :users do
    member do
      get :confirm_email
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
