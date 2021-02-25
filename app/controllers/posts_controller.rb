class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.video.content_type == "video/mp4"
      if @post.valid?
        @post.save
        redirect_to posts_path
      else
        render :new
      end
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if user_signed_in? && current_user.id == @post.user_id
      @post.destroy
    end
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :video).merge(user_id: current_user.id)
  end
end
