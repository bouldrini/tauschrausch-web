Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'sign_in', to: 'devise/sessions#new'
    get 'registration', to: 'devise/registrations#new'
  end
  scope module: 'unsigned' do
    #UNSIGNED AREA
    get '/home', to: 'pages#home', as: :home
  end
  scope module: 'signed' do
    #SIGNED IN AREA
    get '/market', to: 'market#index', as: :market

    resources :users, path: 'user', except: [:index] do
      get ':name/profile', to: :show, as: :profile
      post 'follow', to: 'users#follow'
      get ':name/item_pool', to: 'item_pool#index', as: :item_pool

      resources :trade_items, except: [:index] do
        post 'request_for_trade', to: 'trades#create'
      end

      resources :trades do
        resource :counter_value
        get 'select_counter_value', to: 'trades#select_counter_value'
        post 'abort_trade', to: 'trades#destroy'
      end
      resources :notifications, path: ':name/notifications'
    end
  end
  root to: redirect('/home')
end
