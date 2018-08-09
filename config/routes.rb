Rails.application.routes.draw do
  resources :therapists
  resources :users, only: [:edit]
  get 'users/:id', to: 'users#show', as:'users'
  patch 'users/:id' => 'users#update', as:'update_user'
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root to: 'welcome#index'

 resources :therapists  do
    resources :reservations, only: [:index, :create, :new]
end

resources :reservations, only: [:show]

  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create' 


  get "/signup/user" => "users#new", as: "signup_user"
  get "/signup/therapist" => "users#new", as: "signup_therapist"

end
