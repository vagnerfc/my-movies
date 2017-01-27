Rails.application.routes.draw do
  get 'movies' => 'movies#index'

  get 'movies/new' => 'movies#new'

  get 'movies/:id' => 'movies#show'

  post 'movies' => "movies#create"

  get 'movies/:id/edit' => 'movies#edit'

  put 'movies/:id/' => 'movies#update'

  get 'movies/:id/delete' => 'movies#delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
