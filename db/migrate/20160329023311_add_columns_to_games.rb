class AddColumnsToGames < ActiveRecord::Migration
  def change
    add_column :games, :min_players, :integer
    add_column :games, :max_players, :integer
    add_column :games, :available, :boolean
  end
end
