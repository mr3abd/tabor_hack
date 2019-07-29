class Api::V1::User::SessionController < ApplicationController
    # before_action :user_auth
    def create
        @user = ::User.authenticate(sign_in_params)
        if @user
          render json: @user, status: :ok
        else
          render json: {}, status: :unprocessable_entity
        end    
    end

    private

    def sign_in_params
      params.require(:user).permit(:email, :password)
    end
end
