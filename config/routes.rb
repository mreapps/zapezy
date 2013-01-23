Zapezy::Application.routes.draw do

  resources :programmes


  resources :channels

  get "epg/refresh"
  get "epg/epglist"

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  #resources :users

end
