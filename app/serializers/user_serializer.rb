class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :profile_url, :age, :fav_games, :total_friends, :games
  has_many :reviews
  has_many :game_photos


end


