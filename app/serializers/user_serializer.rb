class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username
  has_many :games, :played_games, :reviews, :game_photos, :friendships
end
