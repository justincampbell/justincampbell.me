class AdminController < ApplicationController
  before_filter :authenticate
  
  def index
    redirect_to admin_posts_url
  end
  
  protected
  
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      if Rails.env.production?
        username.downcase == ENV['ADMIN_USERNAME'] and password == ENV['ADMIN_PASSWORD']
      else
        username.downcase == "justin"
      end
    end
  end
end
