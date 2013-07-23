class ApplicationController < ActionController::Base
  protect_from_forgery
  def cache_everything
    @post = Post.all_cached
    @children = Children.all_cached
  end
  
end