class CreatePokemonTypeJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon_types do |t|
      t.references :pokemon, foreign_key: true
      t.references :type, foreign_key: true
    end
  end
end
