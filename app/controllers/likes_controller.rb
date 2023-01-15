class LikesController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @like = @post.likes.build(like_params)
        @like.user = current_user

        @like.save
        redirect_to @post
    end

    def destroy
      @post = Post.find(params[:post_id])
      @like = @post.likes.find(params[:id])
      @like.destroy

      redirect_to @post
    end
    
    private
    def like_params
      params.require(:like).permit(:post_id, :user_id)
    end
end
