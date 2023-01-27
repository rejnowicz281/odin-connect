class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)
      @comment.author = current_user

      @comment.save
      redirect_to @post
    end

    def destroy
      @comment.destroy

      redirect_to @post
    end

    private
    def comment_params
      params.require(:comment).permit(:post_id, :user_id, :body)
    end

    def set_comment
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
    end
end
