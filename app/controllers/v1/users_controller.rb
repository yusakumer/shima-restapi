class V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    users = User.all
    render json: users, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def create
    User.create!(user_params)
    head :created
  end

  def update
    @user.update!(user_params)
    head :no_content
  end

  def destroy
    @user.destroy!
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :nickname)
  end

  def set_user
    @user = User.find(params[:id])
  end

end