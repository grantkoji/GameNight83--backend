class GameHost < ApplicationRecord
    belongs_to :host, :class_name => "User"
    belongs_to :game

    #host_id
    #game_id
end