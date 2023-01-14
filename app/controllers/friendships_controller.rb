class FriendshipsController < ApplicationController
    before_action :set_friendship, only: [:show, :destroy]
  
    def index
      @friendships = current_user.friendships
    end
  
    def show
    end
  
    def new
      @friendship = current_user.friendships.build
    end
  
    def create
      @friendship = current_user.friendships.create(friendship_params)
  
      if @friendship.save
        redirect_to root_path
      else
        render :new
      end
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
  