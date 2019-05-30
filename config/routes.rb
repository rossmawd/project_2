Rails.application.routes.draw do
  #resources :task_tags, only: [:index, :show] # Does this need any routes?
  resources :tags
  resources :users, only: [:index, :show]
  resources :tasks#, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :projects

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/delete_project/:id', to: 'projects#confirm', as: 'confirm'
end
