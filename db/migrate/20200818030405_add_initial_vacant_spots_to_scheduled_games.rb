class AddInitialVacantSpotsToScheduledGames < ActiveRecord::Migration[6.0]
  def change
    add_column :scheduled_games, :initial_vacant_spots, :integer
  end
end
