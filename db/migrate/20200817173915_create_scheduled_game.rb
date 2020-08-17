class CreateScheduledGame < ActiveRecord::Migration[6.0]
  def change
    create_table :scheduled_games do |t|
      t.integer :host_id
      t.integer :game_id
      t.integer :unix
      t.integer :num_vacancies
      t.string :status
      t.string :public_description
      t.string :private_directions
      t.string :privacy
    end
  end
end
