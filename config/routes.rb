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

  get '/login', to: 'session#new', as: 'login'

  # CRUD - Users
  get '/user/new', to: 'user#new'
  get '/profile', to: 'user#profile'
  post '/user/create', to: 'user#create'
  patch '/user/update', to: 'user#update'

  post '/session/create', to: 'session#create'
end