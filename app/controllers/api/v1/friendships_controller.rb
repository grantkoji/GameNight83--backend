class Api::V1::FriendshipsController < ApplicationController
    def index
       friends = Friendship.all
        render json: friends
    end 

    def show
        friend = Friendship.find(params[:id])
        render json: friend
    end

    def create
        friend = Friendship.create!(friendship_params)
        render json: friend
    end  

    def update
        friend = Friendship.find(params[:id])
        friend.update(friend_params)
        render json: friend
    end

    def destroy
        friend = Friendship.find(params[:id])
        friend.destroy!
        render json: {}
    end

   
    private 

    def friendship_params
        params.require(:friendship).permit!
    end
end