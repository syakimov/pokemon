class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :idx, null: false, index: { unique: true }
      t.string :name
      t.string :height
      t.string :weight

      t.timestamps
    end
  end
end
