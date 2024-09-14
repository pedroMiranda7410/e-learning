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

  # Rotas - Session Controller
    get '/login', to: 'session#new', as: 'login'
    post '/session/create', to: 'session#create'

  # Rotas - User Controller
    get '/user/new', to: 'user#new'
    get '/profile', to: 'user#profile'
    post '/user/create', to: 'user#create'
    patch '/user/update', to: 'user#update'


  # Rotas - Series Controller
    get '/series/new', to: 'series#new'
    get '/series', to: 'series#index'
    post '/series/create', to: 'series#create'
    get '/series/:serie_id', to: 'series#show'

  # Rotas - Lesson Controller
    get '/series/:serie_id/lessons/new', to: "lessons#new", as: "lesson_new"
    post '/lessons/create', to: "lessons#create"
end