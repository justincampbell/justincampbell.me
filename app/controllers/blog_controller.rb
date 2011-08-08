class BlogController < ApplicationController
  def index
    @posts = Post.order "published_at desc"
  end
  
  def show
    @post = Post.find_by_slug params[:slug]
  end
end
