class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    
    if @friendship.save
      redirect_to users_path, notice: 'Added friend.'
    else
      redirect_to users_path, notice: 'Unnable to add friend.'
    end
  end
  
  def destroy
    @friendship = current_user.friendships.find(params[:friend_id])
    @friendship.destroy
    redirect_to user_path(current_user.id), notice: 'Removed friend.'
  end

  private
  
  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
