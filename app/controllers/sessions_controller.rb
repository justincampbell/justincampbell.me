class SessionsController < ApplicationController
  def new
    redirect_to_destination if signed_in?
  end

  def create
    if authenticate params[:password]
      redirect_to_destination
    else
      redirect_to :sign_in
    end
  end

  def destroy
    session[:signed_in] = false

    redirect_to_destination
  end

  private

  def redirect_to_destination
    destination = session.delete(:destination) || :root
    redirect_to destination
  end
end
