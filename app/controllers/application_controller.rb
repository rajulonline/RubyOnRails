class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :requires_sign_in
  # before_filter :isLogged_In
  def cache_everything
    #@post = Post.all_cached
    @post = Post.includes(:children)

  end

  helper_method :current_user

  private

  def requires_sign_in
    redirect_to sign_up_path unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

