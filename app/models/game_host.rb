class GameHost < ApplicationRecord
    belongs_to :user
    belongs_to :game
end