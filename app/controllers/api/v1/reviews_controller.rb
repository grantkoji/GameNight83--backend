class Api::V1::ReviewsController < ApplicationController
    before_action :authorized, only: [:create]
    def index
       reviews = Review.all
        render json: reviews
    end 

    def show
        review = Review.find(params[:id])
        render json: review
    end

    def create
        review = @user.reviews.create(num_stars: params[:num_stars], game_id: params[:game_id], content: params[:content])
        if review.valid?
            render json: review
          else
            render json: {message: "Failed to post your review"}
        end
        
        # review = Review.create!(review_params)
        # render json: review
    end  

    def update
        review = Review.find(params[:id])
        review.update(review_params)
        render json: review
    end

    def destroy
        review = Review.find(params[:id])
        review.destroy!
        render json: {}
    end

   
    private 

    def review_params
        params.require(:review).permit!
    end
end