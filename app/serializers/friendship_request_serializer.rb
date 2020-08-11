class FriendshipRequestSerializer < ActiveModel::Serializer
  attributes :id, :request_name, :user_id, :request_id, :user_name
end
