class Api::V1::UsersController < ApplicationController
    before_action :authorized, only: [:stay_logged_in]
  
    def create
      user = User.create(
        username: params[:username], 
        password: params[:password], 
        name: params[:name],
        fav_games: params[:fav_games],
        age: params[:age],
        profile_url: params[:profile_url]
      )
      if user.valid?
        wristband = encode_token({user_id: user.id})
        render json: {
          user: UserSerializer.new(user),
          token: wristband
        }
      else
        render json: {message: "Failed to create a new user"}, status: 403
      end
    end

    def login
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        wristband = encode_token({user_id: @user.id})
        render json: {
          user: UserSerializer.new(@user),
          token: wristband
        }
      else
        render json: {message: "Incorrect username or password"}
      end
    end
  
  
    def stay_logged_in
      # @user comes from the before_action
      wristband = encode_token({user_id: @user.id})
      render json: {
        user: UserSerializer.new(@user),
        token: wristband
      }
    end
  

    def index
        users = User.all
         render json: users
     end 
 
     def show
         user = User.find(params[:id])
         render json: user
     end

   
 
     def update
         user = User.find(params[:id])
         user.update(user_params)
         render json: user
     end
 
     def destroy
         user = User.find(params[:id])
         user.destroy!
         render json: {}
     end
 
  
  
     private 

    def user_params
        params.require(:user).permit!
    end
  
  
  end




   
   