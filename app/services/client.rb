# frozen_string_literal: true

module Client
  BASE_URL = 'https://pokeapi.co/api/v2'
  POKEMON_URL = 'pokemon'
  TYPE_URL = 'type'
  LIMIT = 2000 # Naive solution, but works fine now!

  class PokemonApiError < StandardError; end

  class << self
    def fetch_pokemons
      api_call("#{BASE_URL}/#{POKEMON_URL}?limit=#{LIMIT}") do |body|
        body.fetch('results')
      end
    end

    def fetch_pokemon_details(url)
      api_call(url) do |body|
        body
      end
    end

    def fetch_types
      api_call("#{BASE_URL}/#{TYPE_URL}?limit=#{LIMIT}") do |body|
        body.fetch('results')
      end
    end

    def api_call(resource_url)
      response = HTTParty.get(resource_url)

      if response.code != 200
        Rails.logger.error "Unexpected response code: #{response.code}"
        raise PokemonApiError.new(response.body)
      end

      yield response.parsed_response
    end
  end
end
