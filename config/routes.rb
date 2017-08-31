Rails.application.routes.draw do
  root 'pages#home'

  get '/login' => 'sessions#new', as: "new_session"
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'

  get '/users/:id' => 'users#show', as: "user"

  get '/entries/new' => 'entries#new', as: "new_entry"
  post '/entries' => 'entries#create'
  delete '/entries/:id' => 'entries#destroy', as: "entry"

  get '/teams' => 'teams#index', as: "teams"
  get '/teams/new' => 'teams#new', as: "new_team"
  post '/teams' => 'teams#create'
  get '/teams/:id' => 'teams#show', as: "team"
  delete '/teams/:id' => 'teams#destroy'

  get '/heats' => 'heats#index', as: "heats"
  post '/heats' => 'heats#create'
  delete '/heats/:id' => 'heats#destroy', as: "heat"

  get '/users/:id/:stat/:time' => 'charts#display'
end
