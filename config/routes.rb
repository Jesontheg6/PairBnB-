Rails.application.routes.draw do

  get 'reservation/Mailer'


  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :users, only: [:index, :show, :edit, :update, :destroy] 
  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]  
 end


  resources :listings do
    resources :reservations, except: [:show]
  end

  resources :reservations, only: [:show]

resources :payments, only: [:new, :create]

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_out" => "clearance/sessions#destroy"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  root 'welcome#index'

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"


# if Clearance.configuration.allow_sign_up?
#       get '/sign_up' => 'users#new', as: 'sign_up'
#     end  

   get '/' => 'welcome#index'
   # get '/new_listing' => 'welcome#create_listing'
   # post '/create_listing' => 'listings#create_listing'

  get 'reservation/Mailer'
   get '/about-us' => 'welcome#About_us'
   get '/profile' => 'users#profile'
   get '/boys' => 'boys#boys'
   get '/babes' => 'babes#babes'
   get '/listings/:id/info' => 'listings#info'
   get '/listings/:listing_id/reservations/:id/my_reservation' => 'reservations#my_reservation'
   get '/reservations/:id/braintree/new' => "braintree#new", as: 'braintree_new'
   post '/braintree/:id/checkout' => "braintree#checkout", as: "braintree_checkout"

  get "/reservations/:id/imhost", to:"reservations#host_reservation"

  end 




# if Clearance.configuration.routes_enabled?
#   Rails.application.routes.draw do




  # resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  # resource :session, controller: "clearance/sessions", only: [:create]

  # resources :users, controller: "clearance/users", only: [:create] do
  #   resource :password,
  #     controller: "clearance/passwords",
  #     only: [:create, :edit, :update]
  # end

  # get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  # delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  # get "/sign_up" => "clearance/users#new", as: "sign_up"
#     root 'welcome#index' 

#     resources :passwords,
#       controller: 'passwords',
#       only: [:create, :new]

#     resource :session,
#       controller: 'sessions',
#       only: [:create]

#     resources :users,
#       controller: 'users',
#       only: Clearance.configuration.user_actions do
#         resource :password,
#           controller: 'passwords',
#           only: [:create, :edit, :update]
#       end

#     get '/sign_in' => 'sessions#new', as: 'sign_in'
#     delete '/sign_out' => 'sessions#destroy', as: 'sign_out'

#     if Clearance.configuration.allow_sign_up?
#       get '/sign_up' => 'users#new', as: 'sign_up'
#     end
#   end
# end