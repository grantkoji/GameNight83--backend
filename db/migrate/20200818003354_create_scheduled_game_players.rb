class CreateScheduledGamePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :scheduled_game_players do |t|
      t.integer :user_id
      t.integer :scheduled_game_id
    end
  end
end
