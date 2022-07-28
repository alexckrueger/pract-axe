Rails.application.routes.draw do

  # Users
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  # Sessions
  post "/sessions" => "sessions#create"

  # Trainings
  get "/trainings" => "trainings#index"
  get "/trainings/:id" => "trainings#show"
  post "/trainings" => "trainings#create"
  delete "/trainings/:id" => "trainings#destroy"
  
  # Throws
  post "/throws" => "throws#create"
  patch "/throws/:id" => "throws#update"
  delete "/throws/:id" => "throws#destroy"
end
