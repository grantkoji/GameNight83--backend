class AddColumnLikesToGamePhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :game_photos, :likes, :integer
  end
end
