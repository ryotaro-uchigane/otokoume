class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @progresses = Progress.where(user_id: params[:id])
  end

  def create
    @user = User.new(user_params)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find
  end
end
