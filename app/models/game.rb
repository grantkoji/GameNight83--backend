class Game < ApplicationRecord
    belongs_to :creator, :class_name => "User"
    has_many :game_hosts
    # has_many :hosts, :class_name => "User", through: :game_hosts
    # has_many :hosts, through: :game_hosts, source: :user 
    # has_many :hosts, through: :game_hosts, source: :user 
end