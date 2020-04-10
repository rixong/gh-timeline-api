class Api::V1::UsersController < ApplicationController
    def create
      @user = User.create(user_params)
      if @user.valid?
        render json: { user: UserSerializer.new(@user) }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end
  
    private
    def user_params
      params.fetch(:user, {}).permit(:name, :password_digest, :bio)
    end
  end