class ScheduledGamePlayerSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :scheduled_game_id
  belongs_to :scheduled_game
end
