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

#### Tasks
- [x] Setup a Rails 6 project
- [x] Create a service to consume this API
- [x] Set up unit tests to verify that it works:
- [x] Create a "Type" model with the attributes you think are necessary according to the API documentation
- [x] Create a "Pokemon" model with the attributes you think are necessary according to the API documentation
- [x] Create a controller containing an index and show method to display the list of Pokemon, and then the details of a particular Pokemon.
- [x] This controller must return a json.
- [x] The #index must return only the id, name and types attributes
- [x] The #show must return all other attributes
- [ ] Set up unit tests to check that it works
- [x] Be careful with n+1 queries
- [x] Then document your project in your README, in particular:
- [x] How to install the project
- [x] How to start the project
- [x] How to update the Pokemon list
- [x] How to consume the API you have set up
- [ ] An implementation of a standard Swagger documentation is appreciated
- [x] Set up a Github Action to play unit tests on your main branch
- [x] Deploy your project on Heroku
- [x] Once finished, you push the code on a GitHub repository and send us the link by email
