class PlayedGame < ApplicationRecord
    belongs_to :host, :foreign_key => :host_id, class_name: "User"
    belongs_to :game
    


    # belongs_to :player, :class_name => "User"
    # belongs_to :game
end