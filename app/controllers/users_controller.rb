class UsersController < ApplicationController
  def myfeed
    @user_birds = User.find(params[:id]).birds
  end
end
