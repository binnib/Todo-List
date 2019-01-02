Rails.application.routes.draw do
  root to: "home#index"

  resources :projects do
    resources :todos
  end
  resources :todos, module: 'developer', only: [:index, :show, :edit, :update]
  devise_for :users

  match '/dashboard', to: "dashboard#index", as: 'dashboard', via: :get
end
