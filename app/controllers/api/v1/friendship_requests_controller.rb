class Api::V1::FriendshipRequestsController < ApplicationController
    before_action :authorized, only: [:create]

    def index
       friendship_requests = FriendshipRequest.all
        render json: friendship_requests
    end 

    def show
        friendship_request = FriendshipRequest.find(params[:id])
        render json: friendship_request
    end

    def create
        friendship_request = FriendshipRequest.create!(user_id: @user.id, request_id: params[:request_id])
        render json: friendship_request
    end  


    def destroy
        friend = FriendshipRequest.find(params[:id])
        friend.destroy!
        render json: {}
    end

   
end