class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate(password)
    return unless password == admin_password

    session[:signed_in] = true
  end

  def ensure_signed_in
    unless signed_in?
      session[:destination] ||= request.path
      redirect_to :sign_in
    end
  end

  def signed_in?
    session[:signed_in]
  end

  private

  def admin_password
    if Rails.env.production?
      ENV['ADMIN_PASSWORD'] || raise("No admin password set")
    else
      "password"
    end
  end
end
