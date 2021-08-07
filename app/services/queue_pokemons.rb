# frozen_string_literal: true

module QueuePokemons
  module_function

  def execute
    queue_data = Client.fetch_pokemons.map do |data|
      { url: data.fetch('url') }
    end

    PokemonSyncQueue.upsert_all(queue_data, unique_by: :url)
  end
end
