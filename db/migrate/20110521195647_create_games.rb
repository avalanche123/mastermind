class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.integer :user_id
      t.boolean :won

      t.timestamps
    end

    add_index :games, :user_id
  end

  def self.down
    drop_table :games
  end
end
