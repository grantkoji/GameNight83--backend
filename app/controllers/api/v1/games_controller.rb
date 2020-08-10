class Api::V1::GamesController < ApplicationController
    before_action :authorized, only: [:create]
    
    def index
       games = Game.all
        render json: games
    end 

    def show
        game = Game.find(params[:id])
        render json: game
    end


    def create
        game = Game.create!(
                            title: params[:title],
                            creator_id: @user.id,
                            min_num_players: params[:min_num_players],
                            max_num_players: params[:max_num_players],
                            min_age: params[:min_age],
                            description: params[:description],
                            instructions_and_rules: params[:instructions_and_rules],
                            image_url: params[:image_url],
                            link_to_game_website: params[:link_to_game_website],
                            game_category: params[:game_category]
                )
        if game.valid?
            render json: game
        else
            render json: {message: "Failed to post your game"}
        end
    end  

    def update
        game = Game.find(params[:id])
        game.update(game_params)
        render json: game
    end

    def destroy
        game = Game.find(params[:id])
        game.destroy!
        render json: {}
    end

   
    private 

    def game_params
        params.require(:game).permit!
    end
end