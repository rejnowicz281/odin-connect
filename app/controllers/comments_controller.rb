class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(comment_params)
        @comment.author = current_user

        @comment.save
        respond_to { |format| format.turbo_stream }
    end

    def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      @comment.destroy

      respond_to { |format| format.turbo_stream }
    end

    private
    def comment_params
      params.require(:comment).permit(:post_id, :user_id, :body)
    end
end
