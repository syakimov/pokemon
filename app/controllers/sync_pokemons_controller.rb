# frozen_string_literal: true

class SyncPokemonsController < ApplicationController
  def index
    render(json: { enqueued_pokemons_count: PokemonSyncQueue.count })
  end

  def create
    enqueued_pokemons_count = QueuePokemons.execute
    SyncTypes.execute
    PokemonsSyncWorker.perform_async

    render(json: { enqueued_pokemons_count: enqueued_pokemons_count })
  end
end
