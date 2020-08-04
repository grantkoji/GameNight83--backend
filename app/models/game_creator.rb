class GameCreator < ApplicationRecord
    belongs_to :creator, :class_name => "User"
    belongs_to :games

    # belongs_to :user
    # has_many :games

    # belongs_to :player
    # belongs_to :game
end