class Game < ApplicationRecord
    belongs_to :game_creator, :class_name => "User"
    has_many :game_hosts, :class_name => "User"
end