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

  get 'download_android_app', to: "apps#download_android_app"

  get 'download_kodi_addon', to: "apps#download_kodi_addon"

  get 'download_gse_iptv', to: "apps#download_gse_iptv"

  get 'download_stv_emulator', to: "apps#download_stv_emulator"

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
