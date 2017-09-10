class UsersController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
    @user = User.find(params[:id])
    @progresses = Progress.where(user_id: params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to users_path
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  private
    def user_params
      params.require(:user).permit(:id, :name, :sex, :age, :univ, :grade)
    end
end
