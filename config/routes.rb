Rails.application.routes.draw do
  get 'prices/index'

  get 'prices/show'

  root   'welcome#index'

  resources :sessions, only: [:new, :create, :destroy]

    get '/logout' => "sessions#destroy"

  resources :users, except: [:destroy, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
