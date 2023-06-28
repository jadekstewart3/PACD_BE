class Api::V1::UsersController < ApplicationController
  def index
    render json: UserSerializer.new(User.all)
  end

  def show
    render json: UserSerializer.new(User.find(params[:id]))
  end

  def create
    user = User.create!(user_params)
    render json: UserSerializer.new(user)
  end

  def update
    render json: UserSerializer.new(User.update!(params[:id], user_params))
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end