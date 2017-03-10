Rails.application.routes.draw do

  #devise_for :users
  # devise_for :users
  resources :sonu_events
  devise_for :admins
  get 'dev_test/index'


  devise_for :users,
  controllers: {
    sessions: "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations",
    confirmations: 'users/confirmations'
  },
    path: "/",
    path_names: { sign_in: 'login',
                  sign_out: 'logout',
                  password: 'secret',
                  unlock: 'unblock',
                  registration: 'inscription',
                  sign_up: 'new' },
    :skip => 'registration'

  devise_scope :user do

    authenticated :user do
      root to: "users/dashboard#index",  as: :authenticated_user_root
    end

    unauthenticated :users do
      root to: "users/sessions#new", as: :unauthenticated_user_root
    end

    get '/inscription/cancel' => 'users/registrations#cancel', :as => 'cancel_user_registration'

    get '/inscription/new' => 'users/registrations#new', :as => 'new_user_registration'
    post '/inscription' => 'users/registrations#create', :as => 'user_registration'

    get '/inscription/edit' => 'users/registrations#edit', :as => 'edit_user_registration'
    put '/inscription' => 'users/registrations#update'

    get '/senha/editar' => 'users/registrations#edit_password', :as => 'password_edit'
    put '/senha' => 'users/registrations#update_password'

    get '/logout' => 'users/sessions#destroy'
  end



  resource :user

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
#  resources :test_controller
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
