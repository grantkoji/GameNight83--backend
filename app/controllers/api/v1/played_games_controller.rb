class Api::V1::PlayedGamesController < ApplicationController
    before_action :authorized, only: [:create]

    def index
       played_games = PlayedGame.all
        render json: played_games
    end 

    def show
        played_game = PlayedGame.find(params[:id])
        render json: played_game
    end

    def create
        played_game = @user.played_games.create!(num_stars: params[:num_stars], game_id: params[:game_id], content: params[:content])
        if played_game.valid?
            render json: played_game
          else
            render json: {message: "Failed to post your game photo"}
        end

        # played_game = PlayedGame.create!(played_game_params)
        # render json: played_game
    end  

    def update
        played_game = PlayedGame.find(params[:id])
        played_game.update(played_game_params)
        render json: played_game
    end

    def destroy
        played_game = PlayedGame.find(params[:id])
        played_game.destroy!
        render json: {}
    end

   
    private 

    def played_game_params
        params.require(:played_game).permit!
    end
end