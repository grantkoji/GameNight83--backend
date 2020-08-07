class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :total_friends, :games
  has_many :reviews
  has_many :game_photos


end
