class Review < ApplicationRecord
    belongs_to :game 
    belongs_to :user
    #may change to belongs_to :played_game

 

end