class ScheduledGamePlayer < ApplicationRecord
    belongs_to :scheduled_game 
    belongs_to :user
    has_one :game, through: :scheduled_game
    has_one :host, :class_name => "User", through: :scheduled_game 

    
    def this_user
        self.user
    end

    def this_scheduled_game
        self.scheduled_game
    end

    def this_game
        self.scheduled_game.game
    end

    def this_game_host
        self.scheduled_game.host
    end

end