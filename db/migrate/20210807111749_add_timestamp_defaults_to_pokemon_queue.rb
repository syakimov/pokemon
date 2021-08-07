class AddTimestampDefaultsToPokemonQueue < ActiveRecord::Migration[6.1]
  def up
    change_column_default(:pokemon_sync_queues, :created_at, -> { 'NOW()' })
    change_column_default(:pokemon_sync_queues, :updated_at, -> { 'NOW()' })
  end

  def down
    change_column_default(:pokemon_sync_queues, :created_at, nil)
    change_column_default(:pokemon_sync_queues, :updated_at, nil)
  end
end
