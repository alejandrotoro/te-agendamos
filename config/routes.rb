TeAgendamos::Application.routes.draw do

  match 'support' => 'supports#contact'
  match 'login_and_register' => 'users#login_and_register'
  match 'login' => 'users#login'
  match 'register' => 'users#register'
  match 'dashboard' => 'users#dashboard'
  match '/providers/login_and_register' => 'providers#login_and_register'
  
  resources :products
  resources :categories
  
  authenticated :provider do
    root :to => 'providers#dashboard', :as => :provider_root
  end
  authenticated :user do
    root :to => 'users#dashboard', :as => :user_root
  end
  root :to => "home#index"
  devise_for :users
  devise_for :providers
end
