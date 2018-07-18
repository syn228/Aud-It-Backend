class ApplicationController < ActionController::API
    def secret_key
        ENV['SECRET_KEY']
    end

    def authorization_token
    token = request.headers["Authorization"]
    end

    def decoded_token
        JWT.decode authorization_token(), secret_key(), true, {algorithm: "HS256"}
    end

    def authenticate(data)
        begin
            (decoded_token())
            render json: data
        rescue JWT::DecodeError
            render json: {
                message: "You're wrong!"
            }, status: :unauthorized
        end
    end

    def try_decode_token
        begin
            decoded = JWT.decode(authorization_token(), secret_key(), true, {algorithm: 'HS256'})
        rescue JWT::VerificationError, JWT::DecodeError
            return nil
        end
        decoded
    end

    def factor_payload(username, id)
        { username: username, id: id }
    end

    def get_token(payload)
        JWT.encode payload, secret_key(), "HS256"
    end

    def valid_token?
        !!try_decode_token
    end

end
