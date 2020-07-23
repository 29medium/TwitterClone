class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def friends
    @friendships = @user.friendships
  end

  def show
    @user_birds = User.find(params[:id]).birds
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
