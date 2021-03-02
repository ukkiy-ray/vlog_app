class PostsController < ApplicationController
  before_action :move_to_index, only: [:edit]
  before_action :set_post, only: [:show, :edit, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.video.content_type == "video/mp4" && @post.valid?
      @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    if user_signed_in? && current_user.id == @post.user_id
      @post.destroy
    end
    redirect_to posts_path
  end

  def edit
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :video).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    @post = Post.find(params[:id])
    unless user_signed_in? && current_user.id == @post.user_id
      redirect_to action: :index
    end
  end
end
