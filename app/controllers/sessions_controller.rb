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
                errors: "Those credentials don't match anything we have in our database"
            }, status: :unauthorized
        end
    end
end
