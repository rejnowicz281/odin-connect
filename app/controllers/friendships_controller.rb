class FriendshipsController < ApplicationController
    before_action :set_friendship, only: [:destroy]
  
    def create
      @friendship = Friendship.create(friendship_params)

      redirect_to root_path
    end
  
    def destroy
      @friendship.destroy

      redirect_to root_path
    end
  
    private
    def set_friendship
        @friendship = Friendship.find(params[:id])
    end

    def friendship_params
        params.require(:friendship).permit(:user_id, :friend_id)
    end
end
  