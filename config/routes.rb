Rails.application.routes.draw do
  root "groups#index"
  resources :groups
  resources :users
end
