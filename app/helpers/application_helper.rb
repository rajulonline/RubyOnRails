module ApplicationHelper
  
  def modify_truncate(content,length)
    truncate(content, :length => length)
  end
end
