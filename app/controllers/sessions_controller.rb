class SessionsController < ApplicationController
    def create
        @user = User.find_by(username: params["username"])

        if (@user && @user.authenticate(params["password"]))
            payload = { id: @user.id, username: params["username"]}
            render json: {
                username: @user.username,
                id: @user.id,
                token: get_token(payload)
            }
        else
            render json: {
                errors: "Your username or password is wrong. Please try again."
            }, status: :unauthorized
        end
    end
end
