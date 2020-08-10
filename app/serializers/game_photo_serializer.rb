class GamePhotoSerializer < ActiveModel::Serializer
  attributes :id, :game_title, :user_name, :user_id, :game_id, :image_url, :caption, :likes, :game_category

end
