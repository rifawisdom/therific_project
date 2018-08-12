Rails.application.routes.draw do
  get 'braintree/new'
  resources :therapists
  resources :users, only: [:edit]
  get 'users/:id', to: 'users#show', as:'users'
  patch 'users/:id' => 'users#update', as:'update_user'
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root to: 'welcome#index'

 resources :therapists  do
    resources :reservations, only: [:show, :index, :create, :new]
end



  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create' 


  get "/signup/user" => "users#new", as: "signup_user"
  get "/signup/therapist" => "users#new", as: "signup_therapist"

   get "/search" => "therapists#search", as: "search"
   post "/search" => "therapists#search_thing"
  
  resources :reservations do 
   post 'braintree/checkout'
   get 'braintree/new'
 end

 resources :reservations, controller: "reservations" do
    resources :reviews, only: [:create, :new]
  end


  resources :admins, only: [:index,]
  delete "admins/destroy_therapist/:id" => "admins#destroy_therapist", as: "destroy_therapist"
  delete "admins/destroy_review/:id" => "admins#destroy_review", as: "destroy_review"

end
