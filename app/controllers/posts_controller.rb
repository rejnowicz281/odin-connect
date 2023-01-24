class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    def index
        friends_ids = current_user.friends.pluck(:id)
        friends_posts = []
        Post.all.each { |post| friends_posts << post if friends_ids.any? { |id| id == post.author_id } }
        @posts = current_user.posts + friends_posts
    end

    def show
    end

    def new
        @post = current_user.posts.build
    end

    def create
        @post = current_user.posts.build(post_params)

        respond_to do |format|
            if @post.save
                format.turbo_stream
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end 
    end

    def edit
    end

    def update
        if @post.update(post_params)
            redirect_to @post
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @post.destroy

        respond_to { |format| format.turbo_stream }
    end

    private
    def post_params
        params.require(:post).permit(:body)
    end

    def set_post
        @post = Post.find(params[:id])
    end
end
