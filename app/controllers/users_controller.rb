class UsersController < ApplicationController


    def show
        @user = User.find_by(id: params[:id])
        authenticate(@user)
    end

    def create
        @user = User.new
    
        @user.username = params[:username]
        @user.password = params[:password]
        @user.first_name = params[:first_name]
        @user.last_name = params[:last_name]
    
        if (@user.save)
          render json: {
            username: @user.username,
            id: @user.id,
            token: get_token(factor_payload(@user.username, @user.id))
          }
        else
          render json: {
            errors: @user.errors.full_messages
          }, status: :unprocessable_entity
        end
    end
end
