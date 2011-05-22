class AddCodeToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :code, :string
  end

  def self.down
    remove_column :games, :code
  end
end
