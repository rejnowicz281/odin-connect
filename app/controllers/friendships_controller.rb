class FriendshipsController < ApplicationController
    def create
      @friendship = current_user.friendships.create(friend_id: params[:friend_id])
      @invitation = current_user.invites_received.find_by(inviter_id: params[:friend_id])

      @invitation.destroy
      redirect_back fallback_location: root_path
    end

    def destroy
      @friendship = Friendship.find(params[:id])
      @friendship.destroy

      redirect_back fallback_location: root_path
    end
end