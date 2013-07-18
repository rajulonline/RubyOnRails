class Children < ActiveRecord::Base
  attr_accessible :child_tc_id, :content, :status, :agent, :parent_tc_id
  belongs_to :post, :dependent=>:destroy
  
end
