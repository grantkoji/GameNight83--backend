class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :password_digest, :string
    add_column :users, :age, :integer
    add_column :users, :fav_games, :string
  end
end
