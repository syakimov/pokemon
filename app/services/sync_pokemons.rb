# frozen_string_literal: true

module SyncPokemons
  module_function

  def execute
    pokemon_to_sync = PokemonSyncQueue.first

    while pokemon_to_sync
      sync_pokemon(pokemon_to_sync)
      pokemon_to_sync = PokemonSyncQueue.first
    end
  end

  def sync_pokemon(pokemon_to_sync)
    details = Client.fetch_pokemon_details pokemon_to_sync.url
    idx, name, height, weight, types = details.values_at('id', 'name', 'height', 'weight', 'types')

    pokemon = Pokemon.find_or_initialize_by(idx: idx)
    pokemon.update!(name: name, height: height, weight: weight)

    types = Type.where(idx: types.map { |type_data| extract_idx(type_data) })

    types.each { |type| PokemonType.find_or_create_by!(pokemon: pokemon, type: type) }

    pokemon_to_sync.destroy
  end

  def extract_idx(type_data)
    url = type_data.dig('type', 'url')
    url.split('/')[6]
  end
end
