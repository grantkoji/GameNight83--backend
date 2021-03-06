class Review < ApplicationRecord
    belongs_to :game 
    belongs_to :user
    #may change to belongs_to :played_game

    def game_title 
        self.game.title
    end

    def game_category
        self.game.game_category
    end

    def user_name
        self.user.username
    end
    
    def game_photo
        self.game.image_url
    end
end