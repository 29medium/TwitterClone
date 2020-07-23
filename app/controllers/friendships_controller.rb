class FriendshipsController < ApplicationController

  def create
    @friendship = Friendship.create(user_id: params[:user_id], friend_id: params[:friend_id])
    
    if @friendship.save
      redirect_to find_friends_user_path(current_user.id), notice: 'Added friend.'
    else
      redirect_to find_friends_user_path(current_user.id), notice: 'Unnable to add friend.'
    end
  end
  
  def destroy
    @friendship = Friendship.where(user_id: params[:user_id], friend_id: params[:friend_id])
    @friendship.delete_all
    redirect_to find_friends_user_path(current_user.id), notice: 'Removed friend.'
  end

  private
  
  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
