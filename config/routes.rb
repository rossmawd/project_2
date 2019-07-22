Rails.application.routes.draw do
  #resources :task_tags, only: [:index, :show] # Does this need any routes?
  resources :tags
  resources :users, only: [:index, :show, :create, :new]
  resources :tasks#, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :projects
  
  # RESTIRCT THESE TO create and show?
  resources :users#,onlt: [:new, :create,:show ]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/delete_project/:id', to: 'projects#confirm', as: 'confirm'
  get '/usersort', to: 'projects#user_sort', as: 'user_sort' # is Marcus's method of passing custom params in the argunent of the path helper inside a link_to ?

  #SIGNUP
  get "signup", to: "users#new", as: "signup"
   #SESSIONS managemt
  get "login", to: "sessions#new", as: "login"
  post "sessions", to: "sessions#create", as: "sessions"
  delete "sessions", to: "sessions#destroy"
end
