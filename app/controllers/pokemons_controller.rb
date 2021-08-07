# frozen_string_literal: true

class PokemonsController < ApplicationController
  def index
    pokemons = Pokemon.includes(:types).limit(2)
    data = pokemons.map do |pokemon|
      { id: pokemon.id, name: pokemon.name, types: pokemon.types.map(&:name) }
    end

    render json: data
  end

  def show
    render(json: { id: pokemon.id,
                   name: pokemon.name,
                   height: pokemon.height,
                   weight: pokemon.weight,
                   types: pokemon.types.map(&:name) })
  end

  private

  def pokemon
    Pokemon.find(params[:id])
  end
end
