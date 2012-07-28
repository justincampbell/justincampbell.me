class BlogController < ApplicationController
  def show
    @post = Post.find_by_slug params[:slug]
  end
end
