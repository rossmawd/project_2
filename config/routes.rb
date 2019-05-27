Rails.application.routes.draw do
  resources :task_tags, only: [:index, :show] # Does this need any routes?
  resources :tags, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :tasks, only: [:index, :show]
  resources :projects, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #get '/adoption_dogs', to: 'dogs#adoption_dogs', as: 'adoption_dogs'
  #get '/adoption_form/:id', to: 'dogs#adoption_form', as: 'adoption_form'
  #post '/adopt_dog/:id', to: 'dogs#adopt_dog', as: 'adopt_dog'
end
