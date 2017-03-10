Rails.application.routes.draw do

  #devise_for :users
  # devise_for :users
  resources :sonu_events
  devise_for :admins
  get 'dev_test/index'







  namespace :crew do
    devise_for :admins,
    controllers:{
      sessions: "crew/admins/sessions",
      passwords: "crew/admins/passwords",
      confirmations: 'crew/admins/confirmations'
    },
      path: '/',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      password: 'secret',
      unlock: 'unblock'
    }

    devise_scope :admin do
      authenticated  do
        root 'admin_dashboard#index',  as: :authenticated_admin_root
        # resources :users
        # #resources :lots
        # resources :admins





        # get '/qualified_users' => 'users#qualified', as: :users_qualified
        # get '/disqualified_users' => 'users#disqualified', as: :users_disqualified
        # get '/waiting_list' => 'users#waiting_list', as: :users_waiting_list
        # get '/pays_list' => 'users#pays_list', as: :users_pays_list
        #
        #
        # #USUARIO ADMIN
        # patch 'move_user_to_lot/:user_id/:lot_id' => 'admins_methods#move_user_to_lot', as: :move_user_to_lot
        # patch 'change_users/:user_id/:user_2_email' => 'admins_methods#change_users', as: :change_users_position
        # patch 'disqualify/:id' => 'admins_methods#disqualify_user', as: :disqualify_user
        # patch 'move_first_user_to_lot/:lot_id' => 'admins_methods#move_first_user_to_lot', as: :move_first_user_to_lot
        #
        # #PAYMENTS
        # patch 'change_payment_status/:id/:status' => 'admins_methods#change_payment_status', as: :change_payment_status
        # patch 'set_billet_portion_paid/:id/:portion_paid' => 'admins_methods#billet_portion_paid', as: :set_billet_portion_paid
        # patch 'remove_payment_method/:id' => 'admins_methods#remove_payment_method', as: :change_payment_method
        #
        # #sistema
        # get '/info_system' => 'admins#info', as: :system_info
        # get '/ejs_list' => 'users#ejs_list', as: :ej_list
        #
        # #excel
        # get 'excel/lot/users/:id' => 'excel#lot_users', as: :download_lot_users_excel
        # #relatorio
        # get 'relatorio' => 'excel#excel_handler', as: :excel_handler
        # get 'excel/generate_xls' => 'excel#generate_xls', as: :generate_xls, format: :xls
        # #ej
        # get 'excel/ejlist' => 'excel#ejlist', format: :xls_ejlist
        #
        # #acess account
        # patch 'login_user/:user_id' => 'admins_methods#login', as: :login_user
      end

      unauthenticated do
        #root to: "admins/sessions#new", as: :unauthenticated_admin_root

      end
    end


    resources :admins

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







 # resources :users
  resources :dev_test
#  resources :test_controller
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
