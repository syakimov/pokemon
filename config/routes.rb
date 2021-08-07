Rails.application.routes.draw do
  root 'pokemons#index'
  resources :pokemons, only: %i[index show]
end
