class FriendshipSerializer < ActiveModel::Serializer
  attributes :id, :friend1_name, :user_id, :friend_id, :friend2_name

  # Nested Array
  # class UserSerializer < ActiveModel::Serializer
  #   has_many :friendships
  
  #   class FriendshipSerializer < ActiveModel::Serializer
  #     attributes :id, :friend1_name, :friend2_name
  #   end
  
  # end
end
