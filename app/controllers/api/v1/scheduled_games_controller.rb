class Api::V1::ScheduledGamesController < ApplicationController
    before_action :authorized, only: [:create]
    
    def index
       scheduled_games = ScheduledGame.all
        render json: scheduled_games
    end 

    def show
        scheduled_game = ScheduledGame.find(params[:id])
        render json: scheduled_game
    end

    def create
        byebug
        scheduled_game = ScheduledGame.create!(
                            game_id: params[:game_id],
                            host_id: @user.id,
                            unix: params[:unix],
                            num_vacancies: params[:num_vacancies],
                            status: params[:status],
                            public_description: params[:public_description],
                            private_directions: params[:private_directions],
                            privacy: params[:privacy]
        )
        if scheduled_game.valid?
            render json: scheduled_game
        else
            render json: {message: "Failed to post your game"}
        end
    end  

    def update
        scheduled_game = ScheduledGame.find(params[:id])
        scheduled_game.update(scheduled_game_params)
        render json: scheduled_game
    end

    def destroy
        scheduled_game = ScheduledGame.find(params[:id])
        scheduled_game.destroy!
        render json: {}
    end

   
    private 

    def scheduled_game_params
        params.require(:scheduled_game).permit(:game_id, :host_id, :unix, :num_vacancies, :status, :public_description, :private_directions, :privacy)
    end
end