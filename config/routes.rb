TeAgendamosNew::Application.routes.draw do
  
  match 'support' => 'supports#contact'
  match 'login_and_register' => 'users#login_and_register'
  match 'login' => 'users#login'
  match 'register' => 'users#register'
  match 'dashboard' => 'users#dashboard'
  match '/edit/:id' => 'schedules#edit'
  
  authenticated :provider do
    root :to => 'providers#dashboard', :as => :provider_root
  end
  authenticated :user do
    root :to => 'users#dashboard', :as => :user_root
  end
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
  resources :schedules

  root :to => "home#index"
end
