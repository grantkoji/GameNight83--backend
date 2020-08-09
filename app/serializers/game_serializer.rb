class GameSerializer < ActiveModel::Serializer
  attributes :id, :title, :creator_id, :min_num_players, :max_num_players, :min_age, :description, :instructions_and_rules, :image_url, :link_to_game_website, :game_category, :creator_username, :average_rating
  has_many :reviews
  has_many :game_photos
end


