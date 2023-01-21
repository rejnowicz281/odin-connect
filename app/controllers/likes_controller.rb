class LikesController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @like = @post.likes.build
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
end
