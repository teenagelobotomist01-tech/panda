Rails.application.routes.draw do
  # Página principal
  root "pages#homepage"

  # Sesiones (login/logout)
  get    "/login",  to: "sessions#new",     as: :login
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout

  # Usuarios (registro y perfil)
  resources :users, only: [:new, :create, :show]

  # Namespace administrador
  namespace :admin do
    resources :users, only: [:index]
  end
end

