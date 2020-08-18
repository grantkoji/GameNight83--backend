class Api::V1::ScheduledGamePlayersController < ApplicationController
    before_action :authorized, only: [:create]
    
    def index
       scheduled_game_players = ScheduledGamePlayer.all
        render json: scheduled_game_players
    end 

    def show
        scheduled_game_player = ScheduledGamePlayer.find(params[:id])
        render json: scheduled_game_player
    end

    def create
        scheduled_game_player = ScheduledGamePlayer.create!(
                            scheduled_game_id: params[:scheduled_game_id],
                            user_id: @user.id
        )
        if scheduled_game_player.valid?
            render json: scheduled_game_player
        else
            render json: {message: "Failed to post you as a player for this game"}
        end
    end  

    def update
        scheduled_game_player = ScheduledGamePlayer.find(params[:id])
        scheduled_game_player.update(scheduled_game_player_params)
        render json: scheduled_game_player
    end

    def destroy
        scheduled_game_player = ScheduledGamePlayer.find(params[:id])
        scheduled_game_player.destroy!
        render json: {}
    end

   
    private 

    def scheduled_game_player_params
        params.require(:scheduled_game_player).permit(:scheduled_game_id)
    end
end