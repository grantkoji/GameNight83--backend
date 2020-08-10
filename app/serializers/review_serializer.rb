class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :game_id, :content, :num_stars, :game_title, :user_name, :game_photo, :game_category
end


