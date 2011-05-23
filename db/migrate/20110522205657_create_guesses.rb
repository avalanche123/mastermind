class CreateGuesses < ActiveRecord::Migration
  def self.up
    create_table :guesses do |t|
      t.string :code, :null => false
      t.integer :matches, :default => 0, :null => false
      t.integer :game_id, :null => false

      t.timestamps
    end

    add_index :guesses, :matches
    add_index :guesses, :game_id
  end

  def self.down
    drop_table :guesses
  end
end
