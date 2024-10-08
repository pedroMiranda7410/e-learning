Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # MÉTODOS QUE EXISTEM PARA ROTAS:
  # GET: Para receber algum dado. Um template ou um dado.
  # POST, UPDATE (patch), DELETE: Executar alguma ação

  # resources :users
  # resources :sessions
  resources :lessons
  # resources :comments
  root "user#dashboard"

  get '/login', to: 'session#new', as: 'login'
  get '/logout', to: 'session#destroy', as: 'logout'

  # CRUD - Users
  get '/user/new', to: 'user#new'
  get '/profile', to: 'user#profile'
  post '/user/create', to: 'user#create'
  patch '/user/update', to: 'user#update'

  post '/session/create', to: 'session#create'

  get '/series/new', to: 'series#new'
  get '/series', to: 'series#index'
  post '/series/create', to: 'series#create'
  get '/series/:serie_id', to: 'series#show'

  get '/series/:serie_id/lessons/new', to: 'lessons#new', as: "lessons_new"
  post '/lessons/create', to: 'lessons#create'
  get '/lessons/:lesson_id', to: 'lessons#show'
  delete '/lessons/:lesson_id/delete', to: 'lessons#delete', as:"lessons_delete"

  post '/comments/create', to: 'comments#create'
  get  '/comments/new', to:'comments#new'
  resources :lessons do
    resources :comments, only: [:create, :new]
  end

end
