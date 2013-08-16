 class ApplicationController < ActionController::Base
  protect_from_forgery
 
  # before_filter :isLogged_In
  def cache_everything
    #@post = Post.all_cached
    @post = Post.includes(:children)
   
  end
  
   helper_method :current_user

private

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end
end