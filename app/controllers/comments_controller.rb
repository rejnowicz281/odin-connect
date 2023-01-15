class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
        @comment.author = current_user
        if @comment.save
          redirect_to @post
        else
          redirect_to @post
        end
    end

    def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
  
      @comment.destroy
    end

    private
    def comment_params
      params.require(:comment).permit(:post_id, :user_id, :body)
    end
end
