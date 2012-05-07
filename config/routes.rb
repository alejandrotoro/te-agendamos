TeAgendamosNew::Application.routes.draw do
  
  match 'support' => 'supports#contact'
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users

  root :to => "home#index"
end
