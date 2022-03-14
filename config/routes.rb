Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }
  get 'currentUser' => 'users#check_current_user'
  resources :users, only: [:update]
  resources :outputs do
    resources :comments, only: [:create]
  end

  namespace :admin do
    resources :users, only: [:index, :show, :update]
    resources :outputs, only: [:update]
  end

  root 'users#check_current_user'
end
