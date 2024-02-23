class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    skip_forgery_protection

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def index
        user = User.all 
        render json: user, status: :ok
    end

    def create
        Rails.logger.debug "Received parameters: #{params.inspect}" # Log received parameters

        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token({user_id: @user.id})
            render json: { user: UserSerializer.new(@user), jwt: @token}, status: :created
        else
            render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private


    def user_params
        params.permit(:name, :username, :email, :password, :password_confirmation)
    end


end
