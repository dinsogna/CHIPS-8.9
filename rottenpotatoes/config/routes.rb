Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')

  get "find_similar/:id", to: 'movies#find_similar', as: 'find_similar'
end
