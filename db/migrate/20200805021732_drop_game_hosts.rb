class DropGameHosts < ActiveRecord::Migration[6.0]
  def change
    drop_table :game_hosts
  end
end
