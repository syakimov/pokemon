# frozen_string_literal: true

class PokemonsSyncWorker
  include Sidekiq::Worker

  def perform
    pokemon_to_sync = PokemonSyncQueue.first

    while pokemon_to_sync
      SyncPokemon.execute(pokemon_to_sync)
      pokemon_to_sync.destroy
      pokemon_to_sync = PokemonSyncQueue.first
    end

    Rails.logger.info 'Pokemon Sync is finished.'
  end
end
