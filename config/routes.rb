#Rails.application.routes.draw do
#  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#  root to: 'tasks#index'
#  resources :tasks 
#end

Rails.application.routes.draw do
  get 'tasks/new'
  get 'tasks/create'
  get 'tasks/destroy'

  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
#  get 'login', to: 'tasks#index'
#  post 'login', to: 'tasks#index'
#  delete 'logout', to: 'tasks#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  resources :tasks, only: [:create, :destroy]
#  resources :tasks
#  resources :users
end
