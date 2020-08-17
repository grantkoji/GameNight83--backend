class ScheduledGameSerializer < ActiveModel::Serializer
  attributes :id, :host_id, :game_id, :unix, :num_vacancies, :status, :public_description, :private_directions, :privacy, :host, :game
end
