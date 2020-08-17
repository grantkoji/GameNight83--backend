class ScheduledGameSerializer < ActiveModel::Serializer
  attributes :id, :host_id, :game_id, :unix, :num_vacancies, :status, :public_description, :private_directions, :privacy
  belongs_to :game 
  belongs_to :host
end
