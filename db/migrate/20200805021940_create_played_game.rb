class CreatePlayedGame < ActiveRecord::Migration[6.0]
  def change
    create_table :played_games do |t|
      t.integer :host_id
      t.integer :game_id
      t.integer :num_team_or_players
      t.string :status, default: "in_progress"
      t.string :winner, default: "undetermined"
    end
  end
end
