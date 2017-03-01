Rails.application.routes.draw do

  get 'dev_test/index'

  devise_for :users
  get 'event/index'

#  get 'test_controller/index'
#  root :to => "test_controller#index"
  
 # devise_for :users

#  devise_for :users, :controllers => {:sessions => 'devise/sessions'}, :skip => [:sessions] do
#    get '/login' => 'devise/sessions#new', :as => :new_user_session
#    post '/login' => 'devise/sessions#create', :as => :user_session
#    get '/logout' => 'devise/sessions#destroy', :as => :destroy_user_session
#  end





 # resources :users
  resources :homes
#  resources :test_controller
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
