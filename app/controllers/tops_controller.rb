class TopsController < ApplicationController
  def index
    if user_signed_in?
      @posts = Post.all
      render 'posts/index'
    else
      render :index
    end
  end
end
