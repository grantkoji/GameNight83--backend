class GamePhoto < ApplicationRecord
    belongs_to :game 
    belongs_to :user
    #may change to belongs_to :played_game
    
    def game_title 
        self.game.title
    end

    def user_name
        self.user.username
    end

end