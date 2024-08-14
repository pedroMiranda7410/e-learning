Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "user#dashboard"
  #root "index_aluno#dashboard"
  # get '/show', to: 'articles#show'
  get '/login', to: 'session#new'
  post '/session/create', to: 'session#create'
  # MÉTODOS QUE EXISTEM PARA ROTAS:
  # GET: Para receber algum dado. Um template ou um dado.
  # POST, UPDATE, DELETE: Executar alguma ação
   
  get '/series/new', to: 'series#new'
  get '/index', to: 'series#index'

end