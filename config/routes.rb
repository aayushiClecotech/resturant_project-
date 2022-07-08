require 'sidekiq/web'
Rails.application.routes.draw do
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
      get 'overview'
      get 'menu'
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
    mount Sidekiq::Web => '/sidekiq'

end
