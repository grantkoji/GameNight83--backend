class CreateGameHosts < ActiveRecord::Migration[6.0]
  def change
    create_table :game_hosts do |t|
      t.integer :host_id
      t.integer :game_id
    end
  end
end
