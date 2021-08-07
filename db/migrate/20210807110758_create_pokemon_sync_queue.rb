class CreatePokemonSyncQueue < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon_sync_queues do |t|
      t.string :url, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
