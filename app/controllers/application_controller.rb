class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def logged_in?
    !!current_user
  end

  def login!(user)
    session[:token] = user.reset_session_token!
    @current_user = user
  end

  def logout!
    current_user.reset_session_token!
    session[:token] = nil
  end

  def must_be_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

  def no_login_twice
    if logged_in?
      redirect_to root_url
    end
  end

end
