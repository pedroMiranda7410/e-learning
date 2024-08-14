Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # MÉTODOS QUE EXISTEM PARA ROTAS:
  # GET: Para receber algum dado. Um template ou um dado.
  # POST, UPDATE (patch), DELETE: Executar alguma ação

  # resources :users
  # resources :sessions
  # resources :lessons
  # resources :comments
  root "user#dashboard"

  get '/login', to: 'session#new'

  # CRUD - Users
  get '/user/new', to: 'user#new'
  get '/user/:id/edit', to: 'user#edit'
  post '/user/create', to: 'user#create'
  patch '/user/:id/update', to: 'user#update'
  delete '/user/:id/delete', to: 'user#delete'

  post '/session/create', to: 'session#create'

  get '/series/new', to: 'series#new'
  get '/index', to: 'series#index'
end