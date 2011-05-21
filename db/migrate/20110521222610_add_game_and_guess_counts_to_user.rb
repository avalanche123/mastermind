class AddGameAndGuessCountsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :games_won, :integer, :default => 0
    add_column :users, :games_lost, :integer, :default => 0
    add_column :users, :average_guess_count, :decimal, :default => 0

    # we need only the games_won index for the leader board, but others might be useful
    # in future
    add_index :users, :games_won
    add_index :users, :games_lost
    add_index :users, :average_guess_count
  end

  def self.down
    remove_column :users, :games_won
    remove_column :users, :games_lost
    remove_column :users, :average_guess_count
  end
end
