Rails.application.routes.draw do
  root "pages#homepage"

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
end

