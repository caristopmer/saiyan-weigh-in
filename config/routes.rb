Rails.application.routes.draw do
  root 'pages#home'

  get '/login' => 'sessions#new', as: "new_session"
  post '/sessions' => 'sessions#create', as: "sessions"
  delete '/sessions' => 'sessions#destroy'

  get '/users' => 'users#index', as: "users"
  post '/users' => 'users#create'
  get '/users/new' => 'users#new', as: "new_user"
  get '/users/:id' => 'users#show', as: "user"
  put '/users/:id' => 'users#update'
  get '/users/:id/edit' => 'users#edit', as: "edit_user"
  delete '/users/:id' => 'users#destroy'
  
  get '/users/:id/entries/new' => 'entries#new', as: "new_entry"
  get '/users/:id/entries' => 'entries#index', as: "entries"
  post '/users/:id/entries' => 'entries#create'
  delete '/users/:user_id/entries/:id' => 'entries#destroy', as: "entry"

  get '/teams' => 'teams#index', as: "teams"
  get '/teams/new' => 'teams#new', as: "new_team"
  post '/teams' => 'teams#create'
  get '/teams/:id' => 'teams#show', as: "team"
  delete '/teams/:id' => 'teams#destroy'

  post '/teams/:id/memberships' => 'memberships#create', as: "memberships"
  delete '/teams/:id/memberships' => 'memberships#destroy'

  get '/users/:id/heats' => 'heats#index', as: "heats"
  post '/users/:id/heats' => 'heats#create'
  delete '/users/:user_id/heats/:id' => 'heats#destroy', as: "heat"

  get '/users/:id/power_levels' => 'power_levels#index', as: "power_levels"
  post '/users/:id/power_levels' => 'power_levels#create'
  delete '/users/:user_id/power_levels/:id' => 'power_levels#destroy', as: "power_level"

  get '/users/:id/:stat/:time' => 'charts#display'
end
