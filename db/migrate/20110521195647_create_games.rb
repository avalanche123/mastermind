class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.integer :user_id, :null => false
      t.boolean :finished, :default => false, :null => false
      t.boolean :won, :null => false, :default => false
      t.string :code, :null => false
      t.integer :guesses_count, :null => false, :default => 0

      t.timestamps
    end

    add_index :games, :user_id
    add_index :games, :finished
    add_index :games, :won
    add_index :games, :guesses_count
  end

  def self.down
    drop_table :games
  end
end
