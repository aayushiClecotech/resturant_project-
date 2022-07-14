require 'sidekiq/web'
Rails.application.routes.draw do
  get 'menu/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    get 'reviews/index'
    get 'home/index'
    get 'restaurants/index'
    get 'restaurants/search', to: 'restaurants#search'
    devise_for :users, :controllers => {:registrations => "users/registrations"}
    root to: "home#index" 
    get 'home/search'
    resources :restaurants do 
      get 'map'
    end  
    resources :restaurants do
      get 'image'
    end 
    resources :restaurants do 
      get 'overview'
    end 

    resources :restaurants do 
      resources :menus
    end  
    
    get '/subscription/new' => 'subscription#new', as: :add_payment_method
    post "/subscription/create" => "subscription#create", as: :create_payment_method
    get '/success' => 'subscription#success', as: :success
    post '/subscription' => 'subscription#subscribe', as: :subscribe
    get 'subscription/subscribe'
    get 'restaurants/addphoto'
    
    resources :restaurants do
      resources :reviews 
    end   

    resources :menus do
    collection  do
      patch :sort
    end
end
    mount Sidekiq::Web => '/sidekiq'

end
