class ScheduledGame < ApplicationRecord
    belongs_to :host, :foreign_key => :host_id, class_name: "User"
    belongs_to :game
    has_many :scheduled_game_players
    # has_many :users, through: :scheduled_game_players

    def game_players 
        self.scheduled_game_players.map do |sgp| 
            sgp.user 
        end
    end


    #add notes to this
    # def host_user
    #     self.host
    # end

    

end