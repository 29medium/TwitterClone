class FriendshipsController < ApplicationController

  def create
    @friendship = Friendship.create(user_id: params[:user_id], friend_id: params[:friend_id])
    
    if @friendship.save
      redirect_to find_friends_user_path(current_user.id), notice: 'Started Following.'
    else
      redirect_to find_friends_user_path(current_user.id), notice: 'Unnable to follow.'
    end
  end
  
  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to find_friends_user_path(current_user.id), notice: 'Unfollowed.'
  end
end
