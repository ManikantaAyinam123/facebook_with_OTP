Rails.application.routes.draw do
 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'home#index'
 
  resources :otp_verifys, only: [:index, :show, :create]


  # root 'posts#index'
 
  
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes
  end

  resources :comments do
    resources :likes
  end

  get 'posts/index'

end


