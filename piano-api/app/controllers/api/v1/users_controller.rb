class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    top_5 = User.all.order(:score).take(5)
    render json: top_5, status: 200
  end

  def create
    user = User.create(user_params)
    render json: user, status: 201
  end

  def show
    render json: @user, status: 200
  end

  def update

  end

  def destroy

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name, :score)
  end


end
