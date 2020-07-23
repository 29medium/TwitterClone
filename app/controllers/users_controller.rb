class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def myfeed
    @user_birds = User.find(params[:id]).birds
  end
end
