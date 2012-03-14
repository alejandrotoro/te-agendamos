TeAgendamos::Application.routes.draw do
  resources :products

  resources :providers

  match 'support' => 'supports#contact'
  match 'login_and_register' => 'users#login_and_register'
  match 'login' => 'users#login'
  match 'register' => 'users#register'
  resources :categories

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => :show
end
