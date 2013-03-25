class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate(password)
    return unless password == admin_password

    session[:signed_in] = true
  end

  def ensure_signed_in
    redirect_to :sign_in unless signed_in?
  end

  def signed_in?
    session[:signed_in]
  end

  private

  def admin_password
    if Rails.env.production?
      ENV['ADMIN_PASSWORD']
    else
      "password"
    end
  end
end
