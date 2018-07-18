class SessionsController < ApplicationController
    def create
        @user = User.find_by(username: params["username"])

        if (@user && @user.authenticate(params["password"]))
            payload = { name: params["username"], first_name: params["first_name"], last_name: params["last_name "]}         
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
