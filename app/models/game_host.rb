class GameHost < ApplicationRecord
    belongs_to :host, :foreign_key => :host_id, class_name: "User"
    belongs_to :game


    # belongs_to :host, :class_name => "User"
    #host_id
    #game_id
end