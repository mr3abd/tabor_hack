class ApplicationController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods
    private

    def user_auth
        authenticate_with_http_token do |token, _options|
            @user = User.find_by(authentication_token: token)
        end
    end
end
