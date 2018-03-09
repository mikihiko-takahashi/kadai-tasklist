#Rails.application.routes.draw do
#  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#  root to: 'tasks#index'
#  resources :tasks 
#end

Rails.application.routes.draw do
#  get 'tasks/new'
#  get 'tasks/create'
#  get 'tasks/destroy'
#  get 'tasks/edit'

  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
#  edit 'logout', to: 'sessions#edit'
#  get 'login', to: 'tasks#index'
#  post 'login', to: 'tasks#index'
#  delete 'logout', to: 'tasks#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
#  resources :tasklists, only: [:create, :edit, :update, :destroy]
  resources :tasks
#  resources :users
end
