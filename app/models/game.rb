class Game < ApplicationRecord
    belongs_to :creator, :foreign_key => :creator_id, class_name: "User"
    has_many :played_games
    has_many :hosts, :class_name => "User", through: :played_games
    has_many :reviews
    has_many :game_photos


    # has_many :game_hosts
    # has_many :hosts, :class_name => "User", through: :game_hosts

    # has_many :hosts, through: :game_hosts, source: :user 
    # has_many :hosts, through: :game_hosts, source: :user 

    # game.creator => instance of user who created game 
    # game.game_hosts => array of all users who host games
end