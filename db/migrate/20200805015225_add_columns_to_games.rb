class AddColumnsToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :min_num_players, :integer
    add_column :games, :max_num_players, :integer
    add_column :games, :min_age, :integer
    add_column :games, :description, :string
    add_column :games, :instructions_and_rules, :string
    add_column :games, :image_url, :string, default: ""
    add_column :games, :link_to_game_website, :string, default: ""
    add_column :games, :game_category, :string
  end
end
