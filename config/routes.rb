Rails.application.routes.draw do

  resources :sonu_events
  devise_for :admins
  devise_for :users
  resources :users
  resources :cars
  get 'dev_test/index'

  
  devise_scope :user do
          get '/login' => 'devise/sessions#new'
          get '/logout' => 'devise/sessions#destroy'
  end

  
  resource :user, :controller => "user"
  
  
  devise_scope :admin do
          get '/login_admin' => 'devise/sessions#new'
          get '/logout_admin' => 'devise/sessions#destroy'
  end

 resource :admin, :controller => "admin" 

#  get 'test_controller/index'
#  root :to => "test_controller#index"
  
 # devise_for :users

#  devise_for :users, :controllers => {:sessions => 'devise/sessions'}, :skip => [:sessions] do
#    get '/login' => 'devise/sessions#new', :as => :new_user_session
#    post '/login' => 'devise/sessions#create', :as => :user_session
#    get '/logout' => 'devise/sessions#destroy', :as => :destroy_user_session
#  end





 # resources :users
  resources :dev_test
  resources :homes
#  resources :test_controller
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
