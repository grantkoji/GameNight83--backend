class FriendshipSerializer < ActiveModel::Serializer
  attributes :id, :friend1_name, :user_id, :friend_id, :friend2_name
end
