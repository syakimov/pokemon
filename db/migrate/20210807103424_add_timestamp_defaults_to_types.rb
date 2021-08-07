# frozen_string_literal: true

class AddTimestampDefaultsToTypes < ActiveRecord::Migration[6.1]
  def up
    change_column_default(:types, :created_at, -> { 'NOW()' })
    change_column_default(:types, :updated_at, -> { 'NOW()' })
  end

  def down
    change_column_default(:types, :created_at, nil)
    change_column_default(:types, :updated_at, nil)
  end
end
