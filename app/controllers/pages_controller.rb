class PagesController < ApplicationController
  def index
    redirect_to blog_path
  end
end
