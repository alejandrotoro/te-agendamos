TeAgendamos::Application.routes.draw do
  resources :products

  match 'support' => 'supports#contact'
  match 'login_and_register' => 'users#login_and_register'
  match 'login' => 'users#login'
  match 'register' => 'users#register'
  match 'dashboard' => 'users#dashboard'
  resources :categories
  
  authenticated :user do
    root :to => 'users#dashboard', :as => :user_root
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => :show
end
