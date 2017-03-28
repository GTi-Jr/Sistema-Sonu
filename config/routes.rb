Rails.application.routes.draw do

  #devise_for :users
  # devise_for :users
  resources :sonu_events
  #devise_for :admins
  get 'dev_test/index'







  namespace :crew do
    devise_for :admins,
    controllers:{
      sessions: "crew/admins/sessions",
      passwords: "crew/admins/passwords",
      confirmations: 'crew/admins/confirmations'
    },
      path: "/",
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      password: 'secret',
      unlock: 'unblock'
    }

    devise_scope :admin do

      authenticated  do
        root 'admin_dashboard#index',  as: :authenticated_admin_root
        get "new_registration" => 'admins/registrations#new', as: :new_admin_registration
        get "edit_registration" => 'admins/registrations#update', as: :update_admin_registration
        get "manage_admin" => 'admin_dashboard#manage_admin', as: :manage_admin
        get "manage_users" => 'users_management#index', as: :manage_users
        get "edit_users/" => 'users_management#update', as: :edit_user
      end

      unauthenticated do
        #root to: "admins/sessions#new", as: :unauthenticated_admin_root

      end

      #get "logout" => 'admins/sessions#destroy'


    end



        resources :admin


  end


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

    unauthenticated :user do
      root to: "users/sessions#new", as: :unauthenticated_user_root
    end

    get '/inscription/cancel' => 'users/registrations#destroy', :as => 'cancel_user_registration'

    get '/inscription/new' => 'users/registrations#new', :as => 'new_user_registration'
    post '/inscription' => 'users/registrations#create', :as => 'user_registration'

    get '/inscription/edit' => 'users/registrations#edit', :as => 'edit_user_registration'
    put '/inscription' => 'users/registrations#update'

    get '/senha/editar' => 'users/registrations#edit_password', :as => 'password_edit'
    put '/senha' => 'users/registrations#update_password'

    get '/logout' => 'users/sessions#destroy'
  end



  resource :users
 #
 #  devise_scope :admin do
 #          get '/login_admin' => 'devise/sessions#new'
 #          get '/logout_admin' => 'devise/sessions#destroy'
 #  end
 #
 # resource :admin, :controller => "admin"







 # resources :users
  resources :dev_test
#  resources :test_controller
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
