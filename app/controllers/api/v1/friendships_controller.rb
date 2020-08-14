class Api::V1::FriendshipsController < ApplicationController
    before_action :authorized, only: [:create]
    def index
       friends = Friendship.all
        render json: friends
    end 

    def show
        friend = Friendship.find(params[:id])
        render json: friend
    end

    # def create
    #     friend = Friendship.create!(friendship_params)
    #     render json: friend
    # end  

    def create
        friend = Friendship.create!(user_id: params[:user_id], friend_id: @user.id)
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
        friends = Friendship.all
        render json: friends
    end

   
    private 

    def friendship_params
        params.require(:friendship).permit!
    end
end