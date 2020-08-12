class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :profile_url, :age, :fav_games, :total_friends, :friend_requests_sent, :friend_requests_received
end


