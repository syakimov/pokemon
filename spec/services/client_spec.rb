# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Client do
  describe '#fetch_pokemons' do
    before do
      allow(HTTParty).to receive(:get).with('https://pokeapi.co/api/v2/pokemon?limit=2000').and_return(response)
    end

    context 'when successful' do
      let(:pokemons) { [{ 'name' => 'bulbasaur', 'url' => 'https://pokeapi.co/api/v2/pokemon/1/' }] }
      let(:response) do
        double(code: 200,
               body: 'body',
               parsed_response: { 'count' => 1118,
                                  'next' => nil,
                                  'previous' => nil,
                                  'results' => pokemons })
      end

      it 'returns parsed response' do
        expect(described_class.fetch_pokemons).to eq pokemons
      end
    end

    context 'when unsuccessful' do
      let(:response) do
        double(code: 500,
               body: '{"error": "Example error code"}',
               parsed_response: { 'error' => 'Example error code' })
      end

      it 'raises an error' do
        expect { described_class.fetch_pokemons }.to raise_error(described_class::PokemonApiError)
      end
    end
  end

  describe '#fetch_types' do
    before do
      allow(HTTParty).to receive(:get).with('https://pokeapi.co/api/v2/type?limit=2000').and_return(response)
    end

    context 'when successful' do
      let(:types) { [{ 'name' => 'normal', 'url' => 'https://pokeapi.co/api/v2/type/1/' }] }
      let(:response) do
        double(code: 200,
               body: 'body',
               parsed_response: { 'count' => 20, 'next' => nil, 'previous' => nil, 'results' => types })
      end

      it 'returns parsed response' do
        expect(described_class.fetch_types).to eq types
      end
    end
  end
end
