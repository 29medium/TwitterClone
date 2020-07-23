class UsersController < ApplicationController
  before_action :set_user, only: [:show, :friends]
  before_action :authenticate_user!

  def show
    @user_birds = User.find(params[:id]).birds
  end

  def find_friends
    @users = User.all
  end

  def friends
    @friendships = @user.friendships
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
