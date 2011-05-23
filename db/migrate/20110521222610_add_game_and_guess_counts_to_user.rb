class AddGameAndGuessCountsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :games_won, :integer, :default => 0
    add_column :users, :games_lost, :integer, :default => 0
    add_column :users, :games_count, :integer, :default => 0
    add_column :users, :guesses_count, :integer, :default => 0

    # these columns are used to sort leader board
    add_index :users, :games_won
    add_index :users, :games_lost
    add_index :users, :games_count
    add_index :users, :guesses_count
  end

  def self.down
    remove_column :users, :games_won
    remove_column :users, :games_lost
    remove_column :users, :games_count
    remove_column :users, :guesses_count
  end
end
