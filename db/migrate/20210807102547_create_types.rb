# frozen_string_literal: true

class CreateTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :types do |t|
      t.string :idx, null: false, index: { unique: true }
      t.string :name, null: false

      t.timestamps
    end
  end
end
