Rails.application.routes.draw do

  use_doorkeeper do

    skip_controllers :authorizations, :applications, :authorized_applications
  end

  scope module: :v1, path: 'v1', defaults: { format: 'json'} do
    devise_for :users, :skip => [:sessions, :registrations], controllers: { passwords: 'v1/users/passwords'}
    devise_for :admins, :skip => [:sessions, :registrations], controllers: { passwords: 'v1/users/passwords'}

    resources :movies do
      member do
        put 'enable'
        put 'disable'
        get 'log'
      end
    end

    resources :user_favorite_movies, path: '/favorite_movies'

    resources :purchases, only: [:index, :show, :create]
    resources :rents, only: [:index, :show, :create] do
      member do
        put 'return'
      end
    end
  end
end
