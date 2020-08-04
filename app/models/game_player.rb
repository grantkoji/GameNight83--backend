class GamePlayer < ApplicationRecord
    belongs_to :player, :class_name => "User"
    belongs_to :game


    # belongs_to :player
    # belongs_to :game

    #player_id
    #game_id
end