class ApplicationController < ActionController::Base
  protect_from_forgery
 
  # before_filter :isLogged_In
  def cache_everything
    #@post = Post.all_cached
    @post = Post.includes(:children)
   
  end
  
  def isLogged_In
    session[:logged_in] = true if http_basic_authenticate_with name: "dhh", password: "secret"
  end
  
end