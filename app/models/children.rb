class Children < ActiveRecord::Base
  attr_accessible :child_tc_id, :content, :status, :agent, :parent_tc_id
  belongs_to :post, :foreign_key=>:parent_tc_id
  belongs_to :requirement,:foreign_key=>:req_id
  def self.all_cached
    Rails.cache.fetch('Children.all'){all}
  end
end
