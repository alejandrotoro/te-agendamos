TeAgendamos::Application.routes.draw do
  resources :products

  resources :providers

  match 'support' => 'supports#contact'
  resources :categories

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => :show
end
