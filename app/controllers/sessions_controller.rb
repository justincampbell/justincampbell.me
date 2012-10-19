class SessionsController < ApplicationController
  def new
    redirect_to :root if signed_in?
  end

  def create
    if authenticate params[:password]
      redirect_to :root
    else
      redirect_to :sign_in
    end
  end

  def destroy
    session[:signed_in] = false

    redirect_to :root
  end
end
