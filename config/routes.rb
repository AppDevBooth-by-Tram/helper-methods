Rails.application.routes.draw do
  root "movies#index"
  # Routes for the Movie resource:
 resources :movies
 resources :directors

  # CREATE
  #post "/movies" => "movies#create", as: :movies # movies_url and movies_path
  #get"/movies/new" => "movies#new", as: :new_movie # new_movie_url and new_movie_path
          
  # READ
  #get "/movies" => "movies#index" 
  #get "/movies/:id" => "movies#show", as: :movie #will create variables movie_path(:id) and movie_url(:id) with movie id as argument
  
  # UPDATE
  #patch"/movies/:id" => "movies#update" 
  #get"/movies/:id/edit" => "movies#edit", as: :edit_movie # edit_movie_path() 
  
  # DELETE
  #delete"/movies/:id" => "movies#destroy" 

  #------------------------------
end