class Api::V1::GamePhotosController < ApplicationController
    before_action :authorized, only: [:create]
    
    def index
       game_photos = GamePhoto.all
        render json: game_photos
    end 

    def show
        game_photo = GamePhoto.find(params[:id])
        render json: game_photo
    end

    def create
        game_photo = GamePhoto.create!(game_photo_params)
        render json: game_photo
    end  


    def create
        game_photo = @user.game_photos.create(num_stars: params[:num_stars], game_id: params[:game_id], content: params[:content])
        render json: game_photo
        
        # review = Review.create!(review_params)
        # render json: review
    end  

    def update
        game_photo = GamePhoto.find(params[:id])
        game_photo.update(game_photo_params)
        render json: game_photo
    end

    def destroy
        game_photo = GamePhoto.find(params[:id])
        game_photo.destroy!
        render json: {}
    end

   
    private 

    def game_photo_params
        params.require(:game_photo).permit!
    end
end