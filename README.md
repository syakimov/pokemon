# Pokemon API

![Pokemon API](https://i.pinimg.com/originals/6c/f6/eb/6cf6eb7ddddfc86f76c2a02e05bc1d37.gif)

## Heroku App
https://fierce-crag-42131.herokuapp.com/pokemons

### Install MacOS
Install `brew` and run `./bin/setup`

### Start the app
With Hivemind: `brew install hivemind` then `hivemind`

Manually
Run `bundle exec rails s` and `bundle exec sidekiq` in separate windows

### API
##### Consume Pokemone API
- GET `/pokemons` -> to get a list of the pokemons, 100 per page
- GET `/pokemons?page=2` -> to get the next pokemon page
- GET `/pokemons/1` => to get the pokemon details for Pokemon with foreign id 1

##### Sync Pokemons
- GET `/sync_pokemons` => Scheduled pokemons for sync count
- POST `/sync_pokemons` => to start a pokemon sync, it returns the count of enqued pokemons to sync