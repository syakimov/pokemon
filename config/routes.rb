Rails.application.routes.draw do
  root 'pokemons#index'
  resources :pokemons, only: %i[index show]
  resources :sync_pokemons, only: %i[index create]
end
