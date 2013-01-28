Zapezy::Application.routes.draw do

  resources :programmes


  resources :channels
  #resources :live_tv

  #show_live_tv :to => "live_tv#show"
  #get "/live_tv/:id", "live_tv#show", :id => 1

  match "live_tv" => "live_tv#index"
  match "live_tv/:id" => "live_tv#show", :as => :live_tv_show


  get "epg/refresh"
  get "epg/epglist"

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  #resources :users

end
