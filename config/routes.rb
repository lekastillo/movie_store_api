Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :v1, path: 'v1', defaults: { format: 'json'} do
    resources :movies
  end
end
