# frozen_string_literal: true

class PokemonsController < ApplicationController
  def index
    data = Pokemon.includes(:types).map do |pokemon|
      { id: pokemon.id, name: pokemon.name, types: pokemon.types.map(&:name) }
    end

    paginate json: data
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
