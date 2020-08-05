class CreateGamePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :game_photos do |t|
      t.integer :user_id
      t.integer :game_id
      t.string :image_url
      t.string :caption
    end
  end
end
