Rails.application.routes.draw do
  root 'pages#home'
  get '/login' => 'sessions#new', as: "new_session"
  post '/sessions' => 'sessions#create', 
  delete '/sessions' => 'sessions#destroy'
  get '/users/:id' => 'users#show', as: "user"
end
