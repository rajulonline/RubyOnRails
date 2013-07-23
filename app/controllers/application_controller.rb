class ApplicationController < ActionController::Base
  protect_from_forgery
  
  after_filter :flash_to_headers

def flash_to_headers
  return unless request.xhr?
  response.headers['X-Message'] = flash[:notice]  unless flash[:notice].blank?
  # repeat for other flash types...

  flash.discard  # don't want the flash to appear when you reload page
end
  
  
  
  def cache_everything
    @post = Post.all_cached
    @children = Children.all_cached
  end
  
end