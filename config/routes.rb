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
      end
    end

    
  end
end
